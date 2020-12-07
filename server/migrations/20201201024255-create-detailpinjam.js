'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Detailpinjams', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      nama_peminjam: {
        allowNull: false,
        type: Sequelize.STRING
      },
      jumlah: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      peminjamanId: {
        type: Sequelize.INTEGER,
            onDelete: 'CASCADE',
            references: {
              model: 'Peminjamans',
              key: 'id',
              as: 'peminjaman',
            }
      },
      bookId: {
        type: Sequelize.INTEGER,
            onDelete: 'CASCADE',
            references: {
              model: 'Books',
              key: 'id',
              as: 'book',
            }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Detailpinjams');
  }
};