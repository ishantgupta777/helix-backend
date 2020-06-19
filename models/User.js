
module.exports = (sequelize, Sequelize) => {
  const User = sequelize.define(
    'user',
    {
      userid: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      firstname: { type: Sequelize.STRING(20), allowNull: false },
      lastname: { type: Sequelize.STRING(20), allowNull: false },
      username: { type: Sequelize.STRING(20), defaultValue: null },
      email: { type: Sequelize.STRING(50), allowNull: false },
      password: { type: Sequelize.STRING(100) , allowNull: false },
      usertype: { type: Sequelize.CHAR(2), allowNull: false },
      phone: { type: Sequelize.STRING(15), defaultValue: null },
      address: { type: Sequelize.TEXT, defaultValue: null },
      approval: { 
        type: Sequelize.BOOLEAN,
        allowNull: true,
        defaultValue: 1, 
      },
      hashcode: { type: Sequelize.STRING(50), allowNull: true, defaultValue: 1 },
      notification_flag: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: 1,
      },
    },
    {
      timestamps: false,
    }
  );

  return User;
};
