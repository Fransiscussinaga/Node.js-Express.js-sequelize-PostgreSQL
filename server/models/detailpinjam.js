'use strict';
    module.exports = (sequelize, DataTypes) => {
      var Detailpinjam = sequelize.define('Detailpinjam', {
        nama_peminjam: DataTypes.STRING,
        jumlah: DataTypes.INTEGER,
        bookId: DataTypes.INTEGER,
        peminjamanId: DataTypes.INTEGER
      }, {});
      Detailpinjam.associate = function(models) {
        // associations can be defined here
        Detailpinjam.belongsTo(models.Peminjaman, {
          as: 'peminjaman',
          foreignKey: 'peminjamanId'
        });
        Detailpinjam.belongsTo(models.Book, {
          as: 'book',
          foreignKey: 'bookId'
        });
      };
      return Detailpinjam;
    };