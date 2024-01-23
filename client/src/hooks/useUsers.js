import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';
// import { Socket } from './socket';

export default function useUsers({ user_id }) {
  const [users, setUsers] = useState([]);

  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      // forceNew: true,
      autoConnect: false,
      reconnectionDelayMax: 1000,
      query: {
        user_id,
      },
    }),
  );
  // const { socket } = Socket({ user_id });

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
      // alert(JSON.stringify(users));
      setUsers(users);
    });
    return () => {
      socket.disconnect();
    };
  }, [socket]);

  const ConnectUser = (user) => {
    socket.emit('user:add', user);
  };

  return { users, ConnectUser };
}
