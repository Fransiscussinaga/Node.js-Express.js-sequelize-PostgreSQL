import model from '../models';
import user from '../models/user';

const { User } = model;

class Users {
  static signUp(req, res) {
    const { name, username, email, password } = req.body
      return User
        .create({
          name,
          username,
          email,
          password
        })
        .then(userData => res.status(201).send({
          success: true,
          message: 'User successfully created',
          userData
        }))
        
    }
    static list(req, res) {
        return User
          .findAll()
          .then(users => res.status(200).send(users));
      }
      static modify(req, res) {
        const { name, username, email, password } = req.body
        return User
          .findByPk(req.params.userId)
          .then((user) => {
            user.update({
              name: name || user.name,
              username: username || user.username,
              email: email || user.email,
              password: password || user.password
            })
            .then((updatedUser) => {
              res.status(200).send({
                message: 'User updated successfully',
                data: {
                    name: name || updatedUser.name,
                    username: username || updatedUser.username,
                    email: email || updatedUser.email,
                    password: password || updatedUser.password
                }
              })
            })
            .catch(error => res.status(400).send(error));
        })
        .catch(error => res.status(400).send(error));
    }
    static delete(req, res) {
        return User
          .findByPk(req.params.userId)
          .then(user => {
            if(!user) {
              return res.status(400).send({
              message: 'user Not Found',
              });
            }
            return user
              .destroy()
              .then(() => res.status(200).send({
                message: 'user successfully deleted'
              }))
              .catch(error => res.status(400).send(error));
          })
          .catch(error => res.status(400).send(error))
      }
    
}

export default Users;