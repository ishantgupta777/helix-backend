var router = require('express').Router();
var user = require('../controllers/auth');
var homepage = require('../controllers/homepage');
var settings = require('../controllers/settings')

router.post('/signUp', user.signUp);

router.post('/login', user.login);

router.get('/events',verifyToken, homepage.displayEvents);

router.get('/flag',verifyToken,settings.showFlag);


function verifyToken(req, res, next) {

    const user_token = req.headers['token'];
    console.log(user_token);
    console.log(req.headers);
    if (typeof user_token !== 'undefined') {
       req.token = user_token;
       next();
    } else {
        res.status(403).json({ message: 'Forbidden' });
    }
}

module.exports = router;
