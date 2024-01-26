import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';
// import { Socket } from './socket';

export default function useUsers({ user_id, room_id }) {
  const [users, setUsers] = useState([]);

  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      // forceNew: true,
      autoConnect: false,
      reconnectionDelayMax: 1000,
      query: {
        user_id,
        room_id: room_id || `users_room`,
      },
    }),
  );


  useEffect(() => {
    if (!socket) {
      return;
    } if (user_id) {
          socket.emit('user:add', { user_id });
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
  }, [socket, user_id]);



  return { users };
}
