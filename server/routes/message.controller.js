import { Router } from 'express';
import MessageController from '../controllers/message.controller.js';

const message_routes = Router();
const message_controller = new MessageController();

message_routes.post('/', message_controller.post_message);
message_routes.get('/', message_controller.get_messages);
message_routes.get('/:id', message_controller.get_message);
message_routes.put('/:id', message_controller.put_message);
message_routes.delete('/:id', message_controller.delete_message);

export default message_routes;
