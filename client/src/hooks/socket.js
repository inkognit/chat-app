import { useRef } from 'react';
import { io } from 'socket.io-client';

export const useSocket = (query) => {
  // const socket = io(process.env.REACT_APP_SERVER_URI, { autoConnect: false, reconnectionDelayMax: 10000, query });
  const { socket } = Socket(query);
  const connectUser = (user) => {
    socket.connect();
    socket.emit('user:add', user);
    // socket.on('users:update');
    socket.emit('active_users:get');
  };
  return { connectUser };
};

export const Socket = (query) => {
  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      // forceNew: true,
      autoConnect: false,
      reconnectionDelayMax: 1000,
      query,
    }),
  );
  return { socket };
};
