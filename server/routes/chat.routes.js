import { Router } from 'express';
import ChatController from '../controllers/chat.controller.js';

const chat_routes = Router();
const chat_controller = new ChatController()
chat_routes.post('/', chat_controller.post_chat);

export default chat_routes;
