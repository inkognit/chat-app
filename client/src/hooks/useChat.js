import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';

export default function useChat({ user_id, chat_id }) {
  // const [users, setUsers] = useState([]);
  const [messages, setMessages] = useState([]);
  // const [log, setLog] = useState(null);

  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      forceNew: true,
      query: {
        chat_id,
        user_id,
      },
    }),
  );

  useEffect(() => {
    if (!socket) {
      return;
    }
    socket.emit('message:get');
    // socket.on('log', (log) => {
    //   setLog(log);
    // });
    console.log(socket);
    socket.on('messages:update', (messages) => {
      console.log('🚀 ~ file: useChat.js:24 ~ socket.on ~ messages:', messages);
      setMessages(messages);
    });
  }, [socket]);

  // метод для отправки сообщения
  const sendMessage = (message) => {
    socket.emit('message:add', message);
  };

  const removeMessage = (message) => {
    socket.emit('message:remove', message);
  };

  return { messages, sendMessage, removeMessage };
}
