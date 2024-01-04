import axios from 'axios';

export const axiosAPI =  ({ link, method, data, params }) => {
  switch (method) {
    case 'POST':
      return  axios.post(link, data);
    case 'GET':
      return  axios.get(link, { params });
    case 'PUT':
      return  axios.put(link, data);
    case 'DELETE':
      return  axios.delete(link);
    default:
      throw { message: 'Не все Параметры указаны' };
  }
};
