import { useEffect,  useState } from 'react';
import { Socket } from './socket';

export default function useChatMessages({ user_id, chat_id }) {
  const [messages, setMessages] = useState([]);
  // const [log, setLog] = useState(null);

const { socket } = Socket({
        chat_id,
        user_id,
        room_id: `chat_room: ${chat_id}`,
});

  useEffect(() => {
    if (!socket) {
      return;
    }
    socket.connect();
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

  const sendMessage = (message) => {
    socket.emit('message:add', message);
  };

  const removeMessage = (message) => {
    socket.emit('message:remove', message);
  };

  return { messages, sendMessage, removeMessage };
}
