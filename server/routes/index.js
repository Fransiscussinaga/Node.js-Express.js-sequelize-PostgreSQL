import Users from '../controllers/user';
import Books from '../controllers/book';
import Peminjamans from '../controllers/peminjaman';
import Detail_pinjams from '../controllers/detailpinjam';
import Detailpinjams from '../controllers/detailpinjam';



        export default (app) => {

          app.get('/api', (req, res) => res.status(200).send({
            message: 'Welcome to the BookStore API!',
          }));
          app.get('/api', (req, res) => res.status(200).send({
            message: 'Welcome to the bookStore API!',
        }));
          
          app.get('/api/books', Books.list); // API route for user to get all books in the database
          app.get('/api/users', Users.list); // API route for user to get all Users in the database
          app.get('/api/peminjamans', Peminjamans.list); // API route for user to get all Peminjamans in the database
          app.get('/api/detailpinjams', Detailpinjams.list); // API route for user to get all detail_pinjam in the database

          app.post('/api/users', Users.signUp); // API route for user to signup
          app.post('/api/users/:userId/books', Books.create); // API route for user to create a book
          app.post('/api/users/:userId/peminjamans', Peminjamans.create); // API route for User to create a Peminjaman
          app.post('/api/detailpinjams/:peminjamanId/:bookId/detailpinjams', Detailpinjams.create); // API route for User to create a Detail pinjam


          app.put('/api/users/:userId', Users.modify); // API route for user to edit a book
          app.put('/api/books/:bookId', Books.modify); // API route for user to edit a book
          app.put('/api/peminjamans/:peminjamanId', Peminjamans.modify); // API route for user to edit a book
          app.put('/api/detailpinjams/:detailpinjamId', Detailpinjams.modify); // API route for user to edit a detail_pinjam

          app.delete('/api/books/:bookId', Books.delete); // API route for user to delete a book
          app.delete('/api/users/:userId', Users.delete); // API route for user to delete a book
          app.delete('/api/peminjamans/:peminjamanId', Peminjamans.delete); // API route for user to delete a peminjamans
          app.delete('/api/detailpinjams/:detailpinjamId', Detailpinjams.delete); // API route for user to delete a detail_pinjam
        };