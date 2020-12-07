'use strict';


    module.exports = (sequelize, DataTypes) => {
      var Peminjaman = sequelize.define('Peminjaman', {
        status: DataTypes.STRING,
        tanggal_pinjam: DataTypes.DATE,
        tanggal_kembali: DataTypes.DATE,
        userId: DataTypes.INTEGER
      }, {});
      Peminjaman.associate = function(models) {
        Peminjaman.belongsTo(models.User, {
          foreignKey: 'userId',
          onDelete: 'CASCADE'
        });
        Peminjaman.belongsToMany(models.Book, {
          through: 'Detail_pinjam',
          as: 'Book',
          foreignKey: 'peminjamanId'
        });
      };
      return Peminjaman;
    };