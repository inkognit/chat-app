import MessageService from '../services/message.services.js';
// import { removeFile } from '../utils/files.js';
import onError from '../utils/onError.js';

const messages = {};

export default function messageHandlers(io, socket) {
  const message_service = new MessageService();
  const {chat_id, user_id, room_id} = socket;

  const updateMessageList = () => {
    io.to(room_id).emit('messages:update', messages[room_id]);
  };

  socket.on('message:get', async () => {
    try {
      const _messages = await message_service.get_messages({ chat_id });
      messages[room_id] = _messages;
      updateMessageList();
    } catch (e) {
      onError(e);
    }
  });

  socket.on('message:add', async (message) => {
    
    try {
      message = await message_service.post_message({
        text: message.text,
        type: message.type || 'any',
        user_id, 
        chat_id,
      });
    } catch (error) {
      console.log(error);
    }
    // message.create_at = Date.now();
    if (!messages[room_id]) {
      messages[room_id] = [];
    };
    messages[room_id].push(message);

    updateMessageList();
  });

  socket.on('message:remove', (messages) => {
    message_service.delete_message(message_ids);
    messages[room_id] = messages[room_id].filter((message) => {
      return !message_ids.includes(message.id);
    });
  
    updateMessageList();
  });
}
