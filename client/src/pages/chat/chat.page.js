import useChatMessages from '../../hooks/useChatMessages';
import MessageList from '../../components/chat_room/message_list/message_list';
import { useParams } from 'react-router';
import { session } from '../../hooks/session';
import { useEffect, useState } from 'react';
import Typography from '@mui/material/Typography';
import { axiosAPI } from '../../api/api';
import UserList from '../../components/chat_room/user_list/user_list.component';
// import Container from '@mui/material/Container';
import Grid from '@mui/material/Grid';
import MessageInputNEW from '../../components/chat_room/message_input/message_input.component';

export const ChatPage = ({ online_users: online }) => {
  const { chat_id } = useParams();
  const { id: user_id } = session;

  const [chat, setChat] = useState({});
  const [users, setUsers] = useState([]);

  const { messages, sendMessage, removeMessage } = useChatMessages({ user_id, chat_id });

  useEffect(() => {
    (async () => {
      try {
        const { users, ...chat } = await axiosAPI({
          link: `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/chats/${chat_id}`,
          method: 'GET',
          params: { user_id },
        });
        setChat(chat);

        setUsers(users.map((ul) => ({ ...ul, is_active: online.includes(ul.id) })));
      } catch (err) {
        console.log(err);
      }
    })();
  }, [chat_id, online, user_id]);

  return (
    <Grid item xs={12} direction="column" justifyContent="center" alignItems="flex-start" spacing={{ xs: 12 }}>
      <Typography>{chat.title}</Typography>
      <Grid container direction="row" justifyContent="center" alignItems="flex-start" spacing={{ xs: 12 }}>
        <Grid item xs={2}>
          <UserList className="user list" users={users} />
        </Grid>
        <Grid item xs={3}>
          <MessageList
            className="message list"
            // log={log}
            messages={messages}
            removeMessage={removeMessage}
            // chat_id={chat_id}
          />

          <MessageInputNEW className="message input" sendMessage={sendMessage} chat_id={chat_id} />
        </Grid>
        {/* <MessageInput className="message input" sendMessage={sendMessage} chat_id={chat_id} /> */}
      </Grid>
    </Grid>
  );
};
