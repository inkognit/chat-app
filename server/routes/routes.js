import { Router } from 'express';
import files_routes from './files.routes.js';
import chat_routes from './chat.routes.js';
import user_routes from './user.routes.js';
import message_routes from './message.routes.js';
import auth_routes from './auth.routes.js';

const routes = Router();

routes.use('/auth', auth_routes);
routes.use('/file', files_routes);
routes.use('/chats', chat_routes);
routes.use('/users', user_routes);
routes.use('/messages', message_routes);

export default routes;
