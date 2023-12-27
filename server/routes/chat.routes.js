import { Router } from 'express';
import ChatController from '../controllers/chat.controller.js';

const chat_routes = Router();
const chat_controller = new ChatController()
chat_routes.post('/', chat_controller.post_chat);
chat_routes.get('/', chat_controller.get_chats);
chat_routes.get('/:id', chat_controller.get_chat);
chat_routes.put('/:id', chat_controller.put_chat);
chat_routes.delete('/:id', chat_controller.delete_chat);

export default chat_routes;
