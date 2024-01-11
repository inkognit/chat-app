import { Router } from 'express';
import MessageController from '../controllers/message.controller.js';
import { session } from '../middlewares/session.middleware.js';

const message_routes = Router();
const message_controller = new MessageController();

message_routes.post('/', session, message_controller.post_message);
message_routes.get('/', session, message_controller.get_messages);
message_routes.get('/:id', session, message_controller.get_message);
message_routes.put('/:id', session, message_controller.put_message);
message_routes.delete('/:id', session, message_controller.delete_message);

export default message_routes;
