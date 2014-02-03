
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', 
    { title: 'Dinkoverte', 
    navbarActive : 'Home' });
};

// GET 'About' page.
exports.about = function(req, res) {
    res.render('about', 
        {title :'Dinkoverte - About', 
        navbarActive: 'About'});
}

exports.contact = function (req, res) {
    res.render('contact', 
        {title : 'Dinkoverte - Contact', 
        navbarActive: 'Contact'});
}