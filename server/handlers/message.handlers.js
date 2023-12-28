import MessageService from '../services/message.services.js';
import { removeFile } from '../utils/files.js';
import onError from '../utils/onError.js';

// "хранилище" для сообщений
const messages = {};

export default function messageHandlers(io, socket) {
  const message_service = new MessageService();
  const { chat_id } = socket;

  // утилита для обновления списка сообщений
  const updateMessageList = () => {
    io.to(chat_id).emit('message_list:update', messages[chat_id]);
  };

  // обрабатываем получение сообщений
  socket.on('message:get', async () => {
    try {
      const _messages = await message_service.get_messages({ chat_id });
      messages[chat_id] = _messages;

      updateMessageList();
    } catch (e) {
      onError(e);
    }
  });

  // обрабатываем создание нового сообщения
  socket.on('message:add', async (message) => {
    try {
      await message_service.post_message({
        text: message.text,
        type: message.type || 'any',
        user_id: message.user_id,
        chat_id: message.chat_id,
      });
    } catch (error) {
      // ошибка сохраннеия сообщения
    }

    message.create_at = Date.now();
    messages[chat_id].push(message);

    updateMessageList();
  });

  socket.on('message:remove', ({ message_ids }) => {
    // const { message_ids } = message;
    message_service.delete_message(message_ids);
    messages[chat_id] = messages[chat_id].filter((m) => !message_ids.includes(m.message_id));
    updateMessageList();
  });
}
