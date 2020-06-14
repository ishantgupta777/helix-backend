var router = require('express').Router();
var user = require('../controllers/auth');

router.post('/signUp', user.signUp);

router.post('/login', user.login);

module.exports = router;
