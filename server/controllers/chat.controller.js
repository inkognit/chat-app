import ChatService from "../services/chat.services.js";

export default class ChatController {
  constructor() {
    this.chat_service = new ChatService()
  }

  async post_chat(req, res) {
    const data = req.body
    const resp = await this.chat_service.post_chat(data)
    return res.send();
  }

  async get_list(req, res) {
    return res.send();
  }

  async get(req, res) {
    return res.send();
  }

  async put(req, res) {
    return res.send();
  }

  async delete(req, res) {
    return res.send();
  }
}
