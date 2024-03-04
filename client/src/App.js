import { BrowserRouter } from 'react-router-dom';
import AppRoutes from './routes/app.routes';
import './App.scss';
import ResponsiveAppBar from './components/appbar/appbar.component';
import storage from './utils/storage';
import { Route, Routes } from 'react-router-dom';
import { SignInPage } from './pages/users/sign-in.page';
import useUsers from './hooks/useUsers';
import { SignUpPage } from './pages/users/sign-up.page';

function App() {
  const user = storage.get(process.env.REACT_APP_USER_KEY || 'chat_app_user');
  const { users } = useUsers({ user_id: user ? user.id : 0 });
  return user ? (
    <BrowserRouter>
      <ResponsiveAppBar />
      <AppRoutes online_users={users} />
    </BrowserRouter>
  ) : (
    <BrowserRouter>
      <Routes>
        <Route path="/sign-up" element={<SignUpPage />} />
        <Route path="*" element={<SignInPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
