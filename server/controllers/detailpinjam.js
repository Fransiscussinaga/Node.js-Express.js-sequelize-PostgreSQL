import model from '../models';
import detailpinjam from '../models/detailpinjam';

            const { Detailpinjam } = model;
            class Detailpinjams {
              static create(req, res) {
                const { nama_peminjam, jumlah } = req.body
                const { peminjamanId } = req.params
                const { bookId } = req.params
                
                return Detailpinjam
                  .create({
                    nama_peminjam,
                    jumlah,
                    peminjamanId,
                    bookId
                  })
                  .then(detailpinjam => res.status(201).send({
                    message: `Your detailpinjam with the nama peminjam ${nama_peminjam} has been created successfully `,
                    detailpinjam
                  }))
                }
                static list(req, res) {
                    return Detailpinjam
                      .findAll()
                      .then(detailpinjams => res.status(200).send(detailpinjams));
                      
                  }
                  static modify(req, res) {
                    const { nama_peminjam, jumlah } = req.body
                    return Detailpinjam
                      .findByPk(req.params.detailpinjamId)
                      .then((detailpinjam) => {
                        detailpinjam.update({
                          nama_peminjam: nama_peminjam || detailpinjam.nama_peminjam,
                          jumlah: jumlah || detailpinjam.jumlah
                        })
                        .then((updatedDetailpinjam) => {
                          res.status(200).send({
                            message: 'Detailpinjam updated successfully',
                            data: {
                              nama_peminjam: nama_peminjam || updatedDetailpinjam.nama_peminjam,
                              jumlah: jumlah || updatedDetailpinjam.jumlah
                            }
                          })
                        })
                        .catch(error => res.status(400).send(error));
                      })
                      .catch(error => res.status(400).send(error));
                  }
                  static delete(req, res) {
                    return Detailpinjam
                      .findByPk(req.params.detailpinjamId)
                      .then(detailpinjam => {
                        if(!detailpinjam) {
                          return res.status(400).send({
                          message: 'Detailpinjam Not Found',
                          });
                        }
                        return detailpinjam
                          .destroy()
                          .then(() => res.status(200).send({
                            message: 'Detailpinjam successfully deleted'
                          }))
                          .catch(error => res.status(400).send(error));
                      })
                      .catch(error => res.status(400).send(error))
                  }
            }
            export default Detailpinjams