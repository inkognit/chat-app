import MessageService from '../services/message.services.js';
// import { removeFile } from '../utils/files.js';
import onError from '../utils/onError.js';

const messages = {};

export default function messageHandlers(io, socket) {
  const message_service = new MessageService();
  const chat_id = +socket.chat_id;
  const user_id = +socket.user_id;

  const updateMessageList = () => {
    io.to(chat_id).emit('messages:update',messages[chat_id] );
  };

  socket.on('message:get', async () => {
    try {
      const _messages = await message_service.get_messages({ chat_id });
      messages[chat_id] = _messages;
      updateMessageList();
    } catch (e) {
      onError(e);
    }
  });


  socket.on('message:add', async (message) => {
    try {
      await message_service.post_message({
        text: message.text,
        type: message.type || 'any',
        user_id,
        chat_id,
      });
    } catch (error) {
      console.log(error);
      // ошибка сохраннеия сообщения
    }

    message.create_at = Date.now();
    messages[chat_id].push(message);

    updateMessageList();
  });

  socket.on('message:remove', ({ message_ids }) => {
    message_service.delete_message(message_ids);
    messages[chat_id] = messages[chat_id].filter((message) => {
      return !message_ids.includes(message.id)
    });
    
    updateMessageList();
  });
}
