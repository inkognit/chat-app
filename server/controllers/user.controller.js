import UserService from '../services/user.services.js';

export default class UserController {
  async post_user(req, res) {
    try {
      const { body } = req;
      const user_service = new UserService();
      const resp = await user_service.post_user(body);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_users(req, res) {
    try {
      const { query } = req;
      const user_service = new UserService();
      const resp = await user_service.get_users(query);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_user(req, res) {
    try {
      const id = +req.params.id;
      const user_service = new UserService();
      const resp = await user_service.get_user(id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async put_user(req, res) {
    try {
      const id = +req.params.id;
      const { body } = req;
      const user_service = new UserService();
      const resp = await user_service.put_user({ ...body, id });
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async delete_user(req, res) {
    try {
      const id = +req.params.id;
      const user_service = new UserService();
      const resp = await user_service.delete_user(id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }
}
