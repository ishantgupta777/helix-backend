const db = require('../models');
const Events = db.events;
const jwt = require('jsonwebtoken');

module.exports.newEvent = (req, res) => {

    jwt.verify(req.token, 'SECRET_KEY', (err, authData) => {
        if (err) {
            res.status(403).json({ message: 'Token verification Failed' });
        } else {
            const {desc,name,date,time,genre,picture} = req.body;
            if (!desc || !name || !date || !time || !genre || !picture){
                return res.status(400).json({message : "Please enter all fields"});
            } else{
            Events.create({
                evt_desc : desc,
                userid : authData['userid'],
                evt_name : name,
                evt_date : date,
                evt_time : time,
                evt_genre : genre,
                evt_img_link : picture
            })
            .then(record =>{
                return res.status(200).json({message : "Successfully created", event : record});
            })
            .catch(err => {
                console.log(err);
                return res.status(500).json({ success: false, message: 'Server error' });
            })}
        }
    })
}

