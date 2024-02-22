import axios from 'axios';
import storage from '../utils/storage';
import { access_token } from '../utils/session';

export const axiosAPI = async ({ to, method, body, params, headers = {} }) => {
  if (access_token) {
    headers['authorization'] = access_token;
  }
  try {
    switch (method) {
      case 'POST':
        const { data: post_data, config: post_config } = await axios.post(
          `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/${to}`,
          body,
          { headers },
        );
        if (post_config.headers.authorization) {
          storage.set('chat_app_user_authorization', post_config.headers.authorization);
        }

        return post_data;
      case 'GET':
        const { data: get_data, config: get_config } = await axios.get(
          `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/${to}`,
          {
            params,
            headers: {
              'Access-Control-Allow-Origin': '*',
              ...headers,
            },
          },
        );

        if (get_config.headers.authorization) {
          storage.set('chat_app_user_authorization', get_config.headers.authorization);
        }

        return get_data;
      case 'PUT':
        const { data: put_data, config: put_config } = await axios.put(
          `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/${to}`,
          body,
          { headers },
        );
        if (put_config.headers.authorization) {
          storage.set('chat_app_user_authorization', put_config.headers.authorization);
        }
        return put_data;
      case 'DELETE':
        const { data: delete_data, config: delete_config } = await axios.delete(
          `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/${to}`,
          { headers },
        );
        if (delete_config.headers.authorization) {
          storage.set('chat_app_user_authorization', delete_config.headers.authorization);
        }
        return delete_data;
      default:
        throw new Error({ message: 'Не все Параметры указаны' });
    }
  } catch (error) {
    alert(JSON.stringify(error.response.data));
    if (error.response.data === 'Invalid Token.') {
      alert('вызывается, когда Invalid Token.');
      storage.remove('chat_app_user_authorization');
      storage.remove('chat_app_user');
    }
    throw new Error({ error: error.response.data || error.messsage || error });
  }
};
