'use strict';
module.exports = (sequelize, DataTypes) => {
  var Book = sequelize.define('Book', {
    
    title: DataTypes.STRING,
    author: DataTypes.STRING,
    description: DataTypes.STRING,
    quantity: DataTypes.INTEGER,
    userId: DataTypes.INTEGER
  }, {});
  Book.associate = function(models) {
    Book.belongsTo(models.User, {
      foreignKey: 'userId',
      onDelete: 'CASCADE'
    });
    Book.belongsToMany(models.Peminjaman, {
			through: 'Detail_pinjam',
			as: 'Books',
			foreignKey: 'bookId'
		});
  };
  return Book;
};