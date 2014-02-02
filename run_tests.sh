#! /bin/bash

# Script to run unit, qunit and integration tests. 

pkill node
set -e
mocha tests/unit/ --ui qunit --reporter nyan --timeout 5000
echo "Unit tests complete"

for D in tests/qunit/*; do
    if [ -d "${D}" ]; then
			DIR="$D/*.html"
			echo "testing in $DIR"
			phantomjs tests/qunit/runner.js $DIR
	fi
done
echo "QUnit tests complete"

foreman start &
sleep 1
mocha tests/integration/ --recursive --ui tdd --reporter nyan --timeout 10000
echo "Integration tests complete"

pkill node
jshint ./tests/integration ./tests/unit

echo "All tests passed!"

