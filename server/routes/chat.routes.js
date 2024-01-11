import { Router } from 'express';
import ChatController from '../controllers/chat.controller.js';
import { session } from '../middlewares/session.middleware.js';

const chat_routes = Router();
const chat_controller = new ChatController();

chat_routes.post('/', session, chat_controller.post_chat);
chat_routes.get('/', session, chat_controller.get_chats);
chat_routes.get('/:id', session, chat_controller.get_chat);
chat_routes.put('/:id', session, chat_controller.put_chat);
chat_routes.delete('/:id', session, chat_controller.delete_chat);

export default chat_routes;
