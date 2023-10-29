const Sequelize = require('sequelize');
const database = require('../config/db_config.js');

const user = database.define('user', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        defaultValue: 1,
        autoIncrement: true,        
        
    },
    userName: {
        type: Sequelize.STRING,
        allowNull: false,        
    },
});

module.exports = user;