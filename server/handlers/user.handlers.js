let users = [];

export default function userHandlers(io, socket) {
  const { user_id, room_id } = socket;

  const updateUserList = () => {
    io.to(room_id).emit('users:update', users);
  };

  socket.on('active_users:get', () => {
    updateUserList();
  });

  socket.on('user:add', async () => {
    socket.to(room_id).emit('log', `User ${user_id} connected`);
    if (!users.includes(user_id)) users.push(user_id);
    updateUserList();
  });

  socket.on('disconnect', () => {
    if (!users.includes(user_id)) return;
    socket.to(room_id).emit('log', `User ${user_id} disconnected`);
    users = users.filter((u) => u !== user_id);
    updateUserList();
  });
}
