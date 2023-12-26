import userHandlers from '../handlers/user.handlers.js';
import messageHandlers from '../handlers/message.handlers.js';

export default function onConnection(io, socket) {
  // извлекаем идентификатор комнаты и имя пользователя
  const { chat_id, user_name } = socket.handshake.query;

  // записываем их в объект сокета
  socket.chat_id = chat_id;
  socket.user_name = user_name;

  // присоединяемся к комнате
  socket.join(chat_id);

  // регистрируем обработчики для пользователей
  userHandlers(io, socket);

  // регистрируем обработчики для сообщений
  messageHandlers(io, socket);
}
