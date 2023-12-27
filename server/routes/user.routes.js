import { Router } from 'express';
import UserController from '../controllers/user.controller.js';

const user_routes = Router();
const user_controller = new UserController();

user_routes.post('/', user_controller.post_user);
user_routes.get('/', user_controller.get_users);
user_routes.get('/:id', user_controller.get_user);
user_routes.put('/:id', user_controller.put_user);
user_routes.delete('/:id', user_controller.delete_user);

export default user_routes;
