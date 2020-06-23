const bcrypt = require('bcrypt');
const validator = require('validator');
var jwt = require('jsonwebtoken');

const db = require('../models');
const Users = db.users;

module.exports.signUp = async (req, res) => {
  try {
    const { email, password, firstname, lastname, usertype } = req.body;

    if (!email || !password || !firstname || !lastname || !usertype)
      return res
        .status(400)
        .json({ success: false, message: 'please send all required fields' });

    if (!validator.isEmail(email))
      return res
        .status(400)
        .json({ success: false, message: 'please send valid email' });

    const userPresent = await Users.findOne({ where: { email } });
    if (userPresent)
      return res
        .status(409)
        .json({ success: false, message: 'user already exists' });

    const hashedPassword = await bcrypt.hashSync(password, 10);
    await Users.create({ ...req.body, password: hashedPassword });
    // console.log(user);

    return res
      .status(200)
      .json({ message: 'User added successfully', success: true });
  } catch (err) {
    console.log(err);
    return res.status(500).json({ message: 'server error', success: false });
  }
};

module.exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password)
      return res
        .status(400)
        .json({ success: false, message: 'please send all required fields' });

    if (!validator.isEmail(email))
      return res
        .status(400)
        .json({ success: false, message: 'please send valid email' });

    const user = await Users.findOne({ where: { email } });
    if (!user)
      return res
        .status(409)
        .json({ success: false, message: 'user does not exist' });

    const passwordCorrect = await bcrypt.compare(password, user.password);
    if (!passwordCorrect)
      return res
        .status(401)
        .json({ success: false, message: 'credentials are incorrect' });

    const {
      firstname,
      lastname,
      usertype,
      username,
      userid,
      phone,
      address,
      notification_flag,
    } = user;
    const token = await jwt.sign(
      {
        email,
        firstname,
        lastname,
        usertype,
        username,
        userid,
        phone,
        address,
        notification_flag,
      },
      'SECRET_KEY'
    );

    // console.log(token);

    return res.status(200).json({
      message: 'User logged in successfully',
      success: true,
      token,
      user,
    });
  } catch (err) {
    console.log(err);
    return res.status(500).json({ message: 'server error', success: false });
  }
};
