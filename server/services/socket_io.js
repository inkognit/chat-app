import userHandlers from '../handlers/user.handlers.js';
import messageHandlers from '../handlers/message.handlers.js';
// import chatHandlers from '../handlers/chat.handler.js';

export default function onConnection(io, socket) {
  const { chat_id, user_id } = socket.handshake.query;

  socket.chat_id = +chat_id;
  socket.user_id = +user_id;

  // присоединяемся к комнате
  socket.join(+chat_id);
  socket.join(+user_id);

  // регистрируем обработчики
  userHandlers(io, socket);
  messageHandlers(io, socket);
  // chatHandlers(io,socket)
}
