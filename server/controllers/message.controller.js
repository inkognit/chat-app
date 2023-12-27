import MessageService from '../services/message.services.js';

export default class MessageController {
  async post_message(req, res) {
    try {
      const { body } = req;
      const message_service = new MessageService();
      const resp = await message_service.post_message(body);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_messages(req, res) {
    try {
      const { query } = req;
      const message_service = new MessageService();
      const resp = await message_service.get_messages(query);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_message(req, res) {
    try {
      const id = +req.params.id;
      const message_service = new MessageService();
      const resp = await message_service.get_message(id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async put_message(req, res) {
    try {
      const id = +req.params.id;
      const { body } = req;
      const message_service = new MessageService();
      const resp = await message_service.put_message({ ...body, id });
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async delete_message(req, res) {
    try {
      const id = +req.params.id;
      const message_service = new MessageService();
      const resp = await message_service.delete_message(id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }
}
