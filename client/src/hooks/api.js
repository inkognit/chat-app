import axios from 'axios';

export const axiosAPI = async ({ link, method, _data, params }) => {
  try {
    switch (method) {
      case 'POST':
        const { data: post_data } = await axios.post(link, _data);
        return post_data;
      case 'GET':
        const { data: get_data } = await axios.get(link, {
          params,
          headers: {
            'Access-Control-Allow-Origin': '*',
          },
        });
        return get_data;
      case 'PUT':
        const { data: put_data } = await axios.put(link, _data);
        return put_data;
      case 'DELETE':
        const { data: delete_data } = await axios.delete(link);
        return delete_data;
      default:
        throw { message: 'Не все Параметры указаны' };
    }
  } catch (error) {
    return { error: error.messsage || error };
  }
};
