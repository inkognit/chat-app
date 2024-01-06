import ChatService from '../services/chat.services.js';

export default class ChatController {
  async post_chat(req, res) {
    try {
      const { body } = req;
      const chat_service = new ChatService();
      const resp = await chat_service.post_chat(body);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_chats(req, res) {
    try {
      const { query } = req;
      const chat_service = new ChatService();
      const resp = await chat_service.get_chats(query);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async get_chat(req, res) {
    try {
      const id = req.params.id;
      const user_id = req.query.user_id;
      const chat_service = new ChatService();
      const resp = await chat_service.get_chat(+id, +user_id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async put_chat(req, res) {
    try {
      const id = +req.params.id;
      const { body } = req;
      const chat_service = new ChatService();
      const resp = await chat_service.put_chat({ ...body, id });
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }

  async delete_chat(req, res) {
    try {
      const id = req.params.id;
      const user_id = req.query.user_id;
      const chat_service = new ChatService();
      const resp = await chat_service.delete_chat(+id, +user_id);
      return res.send(resp);
    } catch (error) {
      return res.send({ message: error.message ? error.message : error });
    }
  }
}
