// import { CgTrashEmpty } from 'react-icons/cg';
// import { GiSpeaker } from 'react-icons/gi';
// import { useSpeechSynthesis } from 'react-speech-kit';
import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';
import TimeAgo from 'react-timeago';
import Divider from '@mui/material/Divider';
import * as React from 'react';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Avatar from '@mui/material/Avatar';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { session } from '../../../hooks/session';

export default function MessageBox({ message, removeMessage }) {
  // const { speak, voices } = useSpeechSynthesis();
  const { type, text } = message;
  const { id: user_id } = session;
  // const lang = document.documentElement.lang || 'en';
  // const voice = voices.find((v) => v.lang.includes(lang) && v.name.includes('Google'));

  // let element;

  // const pathToFile = `${process.env.REACT_APP_SERVER_URI}/files${text}`;

  // switch (type) {
  //   case 'text':
  //     element = (
  //       <>
  //         <button
  //           className="btn"
  //           // озвучиваем текст при нажатии кнопки
  //           onClick={() => speak({ text, voice })}
  //         >
  //           <GiSpeaker className="icon speak" />
  //         </button>
  //         <Typography>{text}</Typography>
  //       </>
  //     );
  //     break;
  //   case 'image':
  //     element = <img src={pathToFile} alt="" />;
  //     break;
  //   case 'audio':
  //     element = <audio src={pathToFile} controls></audio>;
  //     break;
  //   case 'video':
  //     element = <video src={pathToFile} controls></video>;
  //     break;
  //   default:
  //     return null;
  // }
  function onClickDelete() {
    alert(JSON.stringify(message));
    removeMessage({ message_ids: [message.id] });
  }

  const isMyMessage = user_id === message.author_id;

  return (
    <Container dense={''} key={message.id}>
      <ListItem alignItems="flex-start" sx={{ width: '100%', maxWidth: 360, bgcolor: '#c7ffd3', borderRadius: '20px' }}>
        <ListItemAvatar>
          <Avatar alt="" src="/static/images/avatar/1.jpg" />
        </ListItemAvatar>
        <ListItemText
          primary={isMyMessage ? 'Me' : message.author_name}
          secondary={
            <React.Fragment>
              <Typography sx={{ display: 'inline' }} component="span" variant="body2" color="text.primary">
                {text}
              </Typography>

              <Typography
                className="datetime"
                // sx={{ display: '' }}
                // component="span"
                variant="body2"
                color="text.primary"
              >
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
