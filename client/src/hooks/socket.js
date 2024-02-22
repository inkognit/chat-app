import { useRef } from 'react';
import { io } from 'socket.io-client';

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
