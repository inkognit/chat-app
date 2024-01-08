import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';
import TimeAgo from 'react-timeago';
import Divider from '@mui/material/Divider';
import * as React from 'react';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { session } from '../../../hooks/session';

export default function MessageBoxNext({ message, removeMessage }) {
  const { text } = message;
  const { user_id } = session;
  const isMyMessage = user_id === message.author_id;
  
  function onClickDelete() {
    removeMessage({ message_ids: [message.id] });
  }

  return (
    <Container key={message.id}>
      <ListItem alignItems="flex-start" sx={{ width: '100%', maxWidth: 360, bgcolor: '#c7ffd3', borderRadius: '20px' }}>
        <ListItemText
          secondary={
            <React.Fragment>
              <Typography sx={{ display: 'inline' }} component="span" variant="body2" color="text.primary">
                {text}
              </Typography>

              <Typography className="datetime" variant="body2" color="text.primary">
                <TimeAgo date={message.create_at} />
                {isMyMessage && (
                  <IconButton
                    variant="contained"
                    onClick={onClickDelete}
                    sx={{ maxWidth: 25, maxHeight: 25 }}
                    aria-label="delete"
                    size="small"
                  >
                    <DeleteIcon fontSize="inherit" />
                  </IconButton>
                )}
              </Typography>
            </React.Fragment>
          }
        />
      </ListItem>
      <Divider variant="middle" component="li" />
    </Container>
  );
}
