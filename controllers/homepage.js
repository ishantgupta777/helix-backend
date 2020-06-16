const db = require('../models');
const Events = db.events;
const jwt = require('jsonwebtoken');

module.exports.displayEvents = (req,res) => {

    jwt.verify(req.token, 'SECRET_KEY',(err, authData)=>{
        if(err){
            res.status(403).json({message :'Error'});
        } else{
            Events.findAll({ attributes: ['evt_name', 'evt_date', 'evt_time', 'evt_desc', 'evt_img_link'] }).then(events => {
                return res.status(200).json(events,authData)
            })
                .catch(err => {
                    return res.status(500).json({ success: false, message: 'Server error' });
                })
        }
    })
    
    
}

