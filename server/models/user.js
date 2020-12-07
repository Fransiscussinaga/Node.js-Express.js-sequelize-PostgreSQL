'use strict';
    module.exports = (sequelize, DataTypes) => {
      var User = sequelize.define('User', {
        name: DataTypes.STRING,
        username: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
      }, {});
      User.associate = function(models) {
        // associations can be defined here
        User.hasMany(models.Book, {
          foreignKey: 'userId',
        });
        User.hasMany(models.Peminjaman, {
          foreignKey: 'userId',
        });
      };
      return User;
    };