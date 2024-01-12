import { BrowserRouter } from 'react-router-dom';
import AppRoutes from './routes/app.routes';
import './App.scss';
import ResponsiveAppBar from './components/appbar/appbar.component';
import storage from './utils/storage';
import { Route, Routes } from 'react-router-dom';
import { SignInPage } from './pages/users/sign-in.test.page';
import useUsers from './hooks/useUsers';

function App() {
  const data = storage.get(process.env.REACT_APP_USER_KEY || 'chat_app_user');

  const { connectUser } = useUsers({ user_id: data ? data.user.id : null });
  connectUser();

  return (
    <>
      {data && data.user ? (
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
