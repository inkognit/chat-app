import axios from 'axios';
import storage from '../utils/storage';
import { access_token } from '../utils/session';

export const axiosAPI = async ({ to, method, body, params, headers = {} }) => {
  if (access_token) {
    headers['authorization'] = access_token;
  }
  try {
    const { data, config } = await axios({
      method,
      url: `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/${to}`,
      data: body,
      headers,
      params,
    });
    if (config.headers.authorization) {
      storage.set('chat_app_user_authorization', config.headers.authorization);
    }
    return data;
  } catch (error) {
    alert(JSON.stringify(error.response.data));
    if (error.response.data === 'Invalid Token.') {
      alert('вызывается, когда Invalid Token.');
      storage.remove('chat_app_user_authorization');
      storage.remove('chat_app_user');
      window.location.reload();
    }
    throw new Error({ error: error.response.data || error.messsage || error });
  }
};
