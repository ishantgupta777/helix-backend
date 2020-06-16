var router = require('express').Router();
var user = require('../controllers/auth');
var homepage = require('../controllers/homepage');

router.post('/signUp', user.signUp);

router.post('/login', user.login);

router.get('/events',verifyToken, homepage.displayEvents);


function verifyToken(req, res, next) {

    const user_token = req.headers['Token'];
    if (typeof token !== 'undefined') {
       req.token = user_token;
       next();
    } else {
        res.status(403).json({ message: 'Forbidden' });
    }
}

module.exports = router;
