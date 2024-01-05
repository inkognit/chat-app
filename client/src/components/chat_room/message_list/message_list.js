import { useEffect, useRef } from 'react';
import MessageItem from './message_item';
import Typography from '@mui/material/Typography';
import List from '@mui/material/List';
import Grid from '@mui/material/Grid';

export default function MessageList({ log, messages, removeMessage, users }) {
  // иммутабельная ссылка на элемент для отображения системных сообщений
  const logRef = useRef();
  // иммутабельная ссылка на конец списка сообщений
  const bottomRef = useRef();

  // выполняем прокрутку к концу списка при добавлении нового сообщения
  // это может стать проблемой при большом количестве пользователей,
  // когда участники чата не будут успевать читать сообщения
  useEffect(() => {
    bottomRef.current.scrollIntoView({
      behavior: 'smooth',
    });
  }, [messages]);

  // отображаем и скрываем системные сообщения
  // useEffect(() => {
  //   if (log) {
  //     logRef.current.style.opacity = 0.8;
  //     logRef.current.style.zIndex = 1;

  //     const timerId = setTimeout(() => {
  //       logRef.current.style.opacity = 0;
  //       logRef.current.style.zIndex = -1;
  //       clearTimeout(timerId);
  //     }, 1500);
  //   }
  // }, [log]);

  return (
    <Grid className="container message">
      <h2>Messages</h2>
      <List key={'messages list'} sx={{ width: '100%', maxWidth: 360, bgcolor: '#c7f5ff' }}>
        {messages.map((message) => (
          <MessageItem key={message.id} message={message} removeMessage={removeMessage} users={users} />
        ))}
        <Typography ref={bottomRef}></Typography>
        <Typography ref={logRef} className="log">
          {log}
        </Typography>
      </List>
    </Grid>
  );
}
