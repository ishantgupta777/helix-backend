const Sequelize = require('sequelize');

const dbConfig = {
  HOST: 'localhost',
  USER: 'root',
  PASSWORD: '',
  DB: 'httest_live_stream',
  dialect: 'mysql',
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
};

if (process.env.NODE_ENV !== 'production') {
  const sequelize = new Sequelize(
    dbConfig.DB,
    dbConfig.USER,
    dbConfig.PASSWORD,
    {
      host: dbConfig.HOST,
      dialect: dbConfig.dialect,
      operatorsAliases: 0,

      pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle,
      },
    }
  );
  module.exports = sequelize;
} else {
  const sequelize = new Sequelize(process.env.CLEARDB_DATABASE_URL, {
    dialect: dbConfig.dialect,
  });
  module.exports = sequelize;
}
