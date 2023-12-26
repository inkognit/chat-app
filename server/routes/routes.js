import { Router } from 'express';
import files_routes from './files.routes.js';
import chat_routes from './chat.routes.js';

const routes = Router();

routes.use('/file', files_routes);
routes.use('/chat', chat_routes);

export default routes;
