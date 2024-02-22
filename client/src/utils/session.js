import storage from './storage';

export const session = storage.get(process.env.REACT_APP_USER_KEY);
export const access_token = storage.get(`${process.env.REACT_APP_USER_KEY}_authorization`);
