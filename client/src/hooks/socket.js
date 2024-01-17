import { io } from 'socket.io-client';
export const useSocket = (query) => {
  const socket = io(process.env.REACT_APP_SERVER_URI, { autoConnect: false, reconnectionDelayMax: 10000, query });
  const connectUser = (user) => {
    socket.connect();
    socket.emit('user:add', user);
  };
  return { connectUser };
};
