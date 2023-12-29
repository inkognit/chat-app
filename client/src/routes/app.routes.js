import { ChatPage } from '../pages/chat/chat.pages';
import { HomePage } from '../pages/home/home';
import { Route, Routes } from 'react-router-dom';
import { SignInPage } from '../pages/users/auth.pages';
import UsersPage from '../pages/users/users.pages';

const AppRoutes = () => (
  <Routes>
    <Route path="/" element={<HomePage />} />
    <Route path="/chats" element={<ChatPage />} />
    <Route path="/sign-in" element={<SignInPage />} />
    <Route path="/users" element={<UsersPage />} />
  </Routes>
);

export default AppRoutes;
