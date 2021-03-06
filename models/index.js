const Sequelize = require('sequelize');

const sequelize = require('../config/db.config');

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.users = require('./User')(sequelize, Sequelize);
db.events = require('./events')(sequelize, Sequelize);

module.exports = db;
