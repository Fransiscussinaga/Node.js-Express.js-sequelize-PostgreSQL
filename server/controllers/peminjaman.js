import model from '../models';
import peminjaman from '../models/peminjaman';

            const { Peminjaman } = model;

            class Peminjamans {
              static create(req, res) {
                const { status, tanggal_pinjam, tanggal_kembali } = req.body
                const { userId } = req.params
                return Peminjaman
                  .create({
                    status,
                    tanggal_pinjam,
                    tanggal_kembali,
                    userId
                  })
                  .then(peminjaman => res.status(201).send({
                    message: `Your peminjaman with the status ${status} has been created successfully `,
                    peminjaman
                  }))
                }
                static list(req, res) {
                    return Peminjaman
                      .findAll()
                      .then(peminjamans => res.status(200).send(peminjamans));
                  }
                static modify(req, res) {
                    const { status, tanggal_pinjam, tanggal_kembali } = req.body
                    return Peminjaman
                      .findByPk(req.params.peminjamanId)
                      .then((peminjaman) => {
                        peminjaman.update({
                          status: status || peminjaman.status,
                          tanggal_pinjam: tanggal_pinjam || peminjaman.tanggal_pinjam,
                          tanggal_kembali: tanggal_kembali || peminjaman.tanggal_kembali
                        })
                        .then((updatedPeminjaman) => {
                          res.status(200).send({
                            message: 'Peminjaman updated successfully',
                            data: {
                              status: status || updatedPeminjaman.status,
                              tanggal_pinjam: tanggal_pinjam || updatedPeminjaman.tanggal_pinjam,
                              tanggal_kembali: tanggal_kembali || updatedPeminjaman.tanggal_kembali
                            }
                          })
                        })
                        .catch(error => res.status(400).send(error));
                      })
                      .catch(error => res.status(400).send(error));
                  }
                  static delete(req, res) {
                    return Peminjaman
                      .findByPk(req.params.peminjamanId)
                      .then(peminjaman => {
                        if(!peminjaman) {
                          return res.status(400).send({
                          message: 'Peminjaman Not Found',
                          });
                        }
                        return peminjaman
                          .destroy()
                          .then(() => res.status(200).send({
                            message: 'Peminjaman successfully deleted'
                          }))
                          .catch(error => res.status(400).send(error));
                      })
                      .catch(error => res.status(400).send(error))
                  }
            }

            export default Peminjamans