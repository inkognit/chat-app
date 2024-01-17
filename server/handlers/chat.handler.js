import ChatService from '../services/chat.services.js';

const chats = {};

export default function chatHandlers(io, socket) {
  const chat_service = new ChatService();
  const { user_id } = socket;


  const updateChatList = () => {
    io.to(user_id).emit('chat_list:update', chats[user_id]);
  };

  socket.on('chat:get', async () => {
    try {
      const chat_list = await chat_service.get_chats({ user_id });
      chats[user_id] = chat_list;
      updateChatList();
    } catch (error) {}
  });

  socket.on('chat:add', async (chat) => {
    try {
      await chat_service.post_chat({
        users: [{ user_id }, ...chat.users],
        title: chat.title,
      });
      chat.create_at = Date.now();
      chats[user_id].push(chat);
      updateChatList();
    } catch (error) {}
  });

  socket.on('chat:put', async (chat) => {
    try {
      await chat_service.put_chat({
        id: chat.id,
        users: chat.users,
        title: chat.title,
        user_id,
      });
      chats[user_id].push(chat);
      updateChatList();
    } catch (error) {}
  });

  socket.on('chat:delete', (chat) => {
    try {
      chat_service.delete_chat(chat.id, user_id);
      chats[user_id] = chats[user_id].filter((c) => c.chat_id !== chat.id);
    } catch (error) {}
  });
}
