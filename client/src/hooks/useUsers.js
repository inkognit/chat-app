import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';

export default function useUsers({ user_id }) {
  const [users, setUsers] = useState([]);

  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      // forceNew: true,
      autoConnect: false,
      query: {
        user_id,
      },
    }),
  );

  useEffect(() => {
    if (!socket) {
      return;
    }
    socket.connect();
    socket.emit('active_users:get');
    // socket.on('log', (log) => {
    //   setLog(log);
    // });
    socket.on('users:update', (users) => {
      setUsers(users);
    });
    return () => {
      socket.disconnect();
    };
  }, [socket]);

  const connectUser = (user) => {
    socket.emit('user:add', user);
  };
  //   const disconnectUser = (user) => {
  //     socket.emit('', user);
  //   };
  return { users, connectUser };
}
