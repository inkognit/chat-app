// const server_routes = (uri) => (process.env.SERVER_URI || 'http://localhost:3001') + uri;
export const routes = {
  main: '/',
  
  users: '/users',
  user: '/users/',

  chats: '/chats',
  chat: '/chats/',

  sign_in: '/sign-in',
  sign_up: '/sign-up',
};
