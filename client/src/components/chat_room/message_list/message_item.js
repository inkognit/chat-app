import { CgTrashEmpty } from 'react-icons/cg';
import { GiSpeaker } from 'react-icons/gi';
import { useSpeechSynthesis } from 'react-speech-kit';
import TimeAgo from 'react-timeago';
import Divider from '@mui/material/Divider';
import * as React from 'react';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Avatar from '@mui/material/Avatar';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
export default function MessageItem({ key, message, removeMessage }) {
  // утилиты для перевода текста в речь
  const { speak, voices } = useSpeechSynthesis();
  // определяем язык приложения
  const lang = document.documentElement.lang || 'en';
  // мне нравится голос от гугла
  const voice = voices.find((v) => v.lang.includes(lang) && v.name.includes('Google'));

  // элемент для рендеринга зависит от типа сообщения
  let element;

  const { type, text } = message;

  // формируем абсолютный путь к файлу
  const pathToFile = `${process.env.REACT_APP_SERVER_URI}/files${text}`;

  // определяем элемент для рендеринга на основе типа сообщения
  switch (type) {
    case 'text':
      element = (
        <>
          <button
            className="btn"
            // озвучиваем текст при нажатии кнопки
            onClick={() => speak({ text, voice })}
          >
            <GiSpeaker className="icon speak" />
          </button>
          <Typography>{text}</Typography>
        </>
      );
      break;
    case 'image':
      element = <img src={pathToFile} alt="" />;
      break;
    case 'audio':
      element = <audio src={pathToFile} controls></audio>;
      break;
    case 'video':
      element = <video src={pathToFile} controls></video>;
      break;
    default:
      return null;
  }

  // определяем принадлежность сообщения текущему пользователю
  const isMyMessage = 1 === message.author_id;

  return (
    <Container key={key}>
      <ListItem alignItems="flex-start" sx={{ width: '100%', maxWidth: 360, bgcolor: '#c7ffd3' }}>
        <ListItemAvatar>
          <Avatar alt="" src="/static/images/avatar/1.jpg" />
        </ListItemAvatar>
        <ListItemText
          primary={isMyMessage ? 'Me' : message.author_id}
          secondary={
            <React.Fragment>
              <Typography sx={{ display: 'inline' }} component="span" variant="body2" color="text.primary">
                {text}
              </Typography>
              {isMyMessage && (
                <button className="btn" onClick={() => removeMessage(message)}>
                  <CgTrashEmpty className="icon remove" />
                </button>
              )}
              <Typography
                className="datetime"
                // sx={{ display: '' }}
                // component="span"
                variant="body2"
                color="text.primary"
              >
                <TimeAgo date={message.create_at} />
              </Typography>
            </React.Fragment>
          }
        />
      </ListItem>
      <Divider variant="inset" component="li" />
    </Container>
  );
}
