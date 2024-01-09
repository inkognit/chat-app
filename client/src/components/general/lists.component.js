import ListItemButton from '@mui/material/ListItemButton';
import { Link } from 'react-router-dom';

export const ListItemLink = (props) => <ListItemButton component={Link} {...props} />;
