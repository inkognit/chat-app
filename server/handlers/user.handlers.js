const users = {};

export default function userHandlers(io, socket) {
  const { chat_id, user_name } = socket;

  if (!users[chat_id]) {
    users[chat_id] = [];
  }


  const updateUserList = () => {
    io.to(chat_id).emit('user_list:update', users[chat_id]);
  };


  socket.on('user:add', async (user) => {
   
    socket.to(chat_id).emit('log', `User ${user_name} connected`);
    // записываем идентификатор сокета пользователя
    user.socket_id = socket.id;
    users[chat_id].push(user);
    updateUserList();
  });


  socket.on('disconnect', () => {
    if (!users[chat_id]) return;
    socket.to(chat_id).emit('log', `User ${user_name} disconnected`);
    users[chat_id] = users[chat_id].filter((u) => u.socket_id !== socket.id);
    updateUserList();
  });
}
