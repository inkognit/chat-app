import { ChatPage } from '../pages/chat/chat.page';
import { HomePage } from '../pages/home/home';
import { Route, Routes } from 'react-router-dom';
import { UsersPage } from '../pages/users/users.page';
import { ChatListPage } from '../pages/chat/chat_list.page';
import { SignInPage } from '../pages/users/sign-in.page';
import { UserPage } from '../pages/users/user.page';

const AppRoutes = ({ online_users }) => (
  <Routes>
    <Route path="/" element={<HomePage />} />

    <Route path="/chats" element={<ChatListPage />} />
    <Route path="/chats/:chat_id" element={<ChatPage online_users={online_users} />} />

    {/* <Route path="/sign-up" element={<SignUpPage />} /> */}
    <Route path="/sign-in" element={<SignInPage />} />

    <Route path="/users" element={<UsersPage online_users={online_users} />} />
    <Route path="/users/:user_id" element={<UserPage />} />
  </Routes>
);

export default AppRoutes;
