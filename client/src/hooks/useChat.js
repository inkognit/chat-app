
import { useEffect, useRef, useState } from 'react';
import { io } from 'socket.io-client';
import storage from '../utils/storage';

export default function useChat() {
  // извлекаем данные пользователя из локального хранилища
  const user = storage.get(process.env.USER_KEY);
  const [users, setUsers] = useState([]);
  const [messages, setMessages] = useState([]);
  const [log, setLog] = useState(null);
  // иммутабельное состояние для сокета
  const { current: socket } = useRef(
    io(process.env.SERVER_URI, {
      query: {
        chat_id: user.chat_id,
        user_name: user.user_name,
      },
    }),
  );

  // регистрируем обработчики
  useEffect(() => {
    // сообщаем о подключении нового пользователя
    socket.emit('user:add', user);

    // запрашиваем сообщения из БД
    socket.emit('message:get');

    // обрабатываем получение системного сообщения
    socket.on('log', (log) => {
      setLog(log);
    });

    // обрабатываем получение обновленного списка пользователей
    socket.on('user_list:update', (users) => {
      setUsers(users);
    });

    // обрабатываем получение обновленного списка сообщений
    socket.on('message_list:update', (messages) => {
      setMessages(messages);
    });
  }, []);

  // метод для отправки сообщения
  const sendMessage = (message) => {
    socket.emit('message:add', message);
  };


  const removeMessage = (message) => {
    socket.emit('message:remove', message);
  };

  return { users, messages, log, sendMessage, removeMessage };
}
