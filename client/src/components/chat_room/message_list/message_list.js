import Typography from '@mui/material/Typography';
import List from '@mui/material/List';
import Grid from '@mui/material/Grid';
import MessageBox from './message_box';
import MessageBoxNext from './message_box_next';
import CssBaseline from '@mui/material/CssBaseline';

export default function MessageList({ messages, removeMessage }) {

  let isBefore = false;
  return (
    <Grid className="container message">
      <CssBaseline />

        <Typography variant="h4" component="h4">
          Messages
        </Typography>
        <List
          key={'messages list'}
          sx={{
            width: '100%',
            maxWidth: 360,
            height: '100%',
            position: 'relative',
            overflow: 'auto',
            maxHeight: 480,
            '& ul': { padding: 0 },
            bgcolor: '#07c2db',
            borderRadius: '20px',
            mb: 2,
          }}
        >
          {messages.map((message, index) => {
            if (index > 0) {
              isBefore = messages[index - 1].author_id === message.author_id;
            }
            return isBefore ? (
              <MessageBoxNext key={message.id} message={message} removeMessage={removeMessage} />
            ) : (
              <MessageBox key={message.id} message={message} removeMessage={removeMessage} />
            );
          })}
        </List>

    </Grid>
  );
}
