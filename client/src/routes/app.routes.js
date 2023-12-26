import { Home } from '../pages/home/home';
import { Route, Routes } from 'react-router-dom';

const AppRoutes = () => (
  <Routes>
    <Route path="*" element={<Home />} />
  </Routes>
);

export default AppRoutes;
