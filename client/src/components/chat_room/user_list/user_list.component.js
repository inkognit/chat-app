import * as React from 'react';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';

import CheckCircleOutlineRoundedIcon from '@mui/icons-material/CheckCircleOutlineRounded';
import { ListItemLink } from '../../general/lists.component';
import { routes } from '../../../routes/routes';

export default function UserList({ users = [] }) {
  return (
    <Grid className="container users">
      <Typography variant="h4" component="h4">
        Пользователи
      </Typography>
      <List
        sx={{
          width: '100%',
          maxWidth: 360,
          position: 'relative',
          overflow: 'auto',
          maxHeight: 300,
          '& ul': { padding: 0 },
          bgcolor: '#cef2ed',
          borderRadius: '20px',
        }}
      >
        {users.map((user) => {
          return (
            <ListItem
              key={user.id}
              secondaryAction={<CheckCircleOutlineRoundedIcon color={user.is_active ? 'success' : 'black'} />}
              disablePadding
            >
              <ListItemLink to={routes.user + `${user.id}`}>
                <ListItemText id={user.id} primary={user.name} />
              </ListItemLink>
            </ListItem>
          );
        })}
      </List>
    </Grid>
  );
}
