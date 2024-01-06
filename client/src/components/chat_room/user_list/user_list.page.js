import * as React from 'react';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';

import CheckCircleOutlineRoundedIcon from '@mui/icons-material/CheckCircleOutlineRounded';

export default function UserList({ users = [] }) {
  return (
    <List dense sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
      {users.map((user) => {

        return (
          <ListItem
            key={user.id}
            secondaryAction={<CheckCircleOutlineRoundedIcon color={user.is_active ? 'success' : 'black'} />}
            disablePadding
          >
            <ListItemButton>
              <ListItemText id={user.id} primary={user.name} />
            </ListItemButton>
          </ListItem>
        );
      }
      )}
    </List>
  );
}
