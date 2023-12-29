import { BrowserRouter } from 'react-router-dom';
import AppRoutes from './routes/app.routes';
import './App.scss';
import ResponsiveAppBar from './components/appbar';

function App() {
  return (
    <BrowserRouter>
      <ResponsiveAppBar/>
      <AppRoutes />
    </BrowserRouter>
  );
}

export default App;
