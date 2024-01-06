import { BrowserRouter } from 'react-router-dom';
import AppRoutes from './routes/app.routes';
import './App.scss';
import ResponsiveAppBar from './components/appbar/appbar.component';
import storage from './utils/storage';
import { Route, Routes } from 'react-router-dom';
import { SignInPage } from './pages/users/sign-in.page';
import useUsers from './hooks/useUsers';

function App() {
  const user = storage.get(process.env.REACT_APP_USER_KEY || 'chat_app_user');
  const { connectUser } = useUsers({ user_id: user.user_id });
  connectUser();
  return (
    <>
      {user ? (
        <BrowserRouter>
          <ResponsiveAppBar />
          <AppRoutes />
        </BrowserRouter>
      ) : (
        <>
          <BrowserRouter>
            <Routes>
              <Route path="*" element={<SignInPage />} />
            </Routes>
          </BrowserRouter>
        </>
      )}
    </>
  );
}

export default App;
