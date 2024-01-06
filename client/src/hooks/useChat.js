import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';

export default function useChat({ user_id, chat_id }) {
  const [messages, setMessages] = useState([]);
  // const [log, setLog] = useState(null);

  const { current: socket } = useRef(
    io(process.env.REACT_APP_SERVER_URI, {
      // forceNew: true,
      autoConnect: false,
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
    socket.connect()
    socket.emit('message:get');

    // socket.on('log', (log) => {
    //   setLog(log);
    // });
    socket.on('messages:update', (messages) => {
      setMessages(messages);
    });
    return () => {
      socket.disconnect();
    };
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
