import storage from '../utils/storage';

export const session = storage.get(process.env.REACT_APP_USER_KEY);