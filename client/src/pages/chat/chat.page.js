import useChat from '../../hooks/useChat';
import MessageList from '../../components/chat_room/message_list/message_list';
import { useParams } from 'react-router';
import { session } from '../../hooks/session';
import { useEffect, useState } from 'react';
import { axiosAPI } from '../../hooks/api';
import useUsers from '../../hooks/useUsers';
import UserList from '../../components/chat_room/user_list/user_list.component';
// import Container from '@mui/material/Container';
import Grid from '@mui/material/Grid';
import MessageInputNEW from '../../components/chat_room/message_input/message_input.component';

export const ChatPage = () => {
  const { chat_id } = useParams();
  const { user_id } = session;
  const [chat, setChat] = useState(null);
  const { messages, log, sendMessage, removeMessage } = useChat({ user_id, chat_id });
  useEffect(() => {
    async function fetchData() {
      try {
        const data = await axiosAPI({
          link: `http://localhost:3000/api/chats/${chat_id}`,
          method: 'GET',
          params: { chat_id, user_id },
        });
        setChat(data);
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, []);
  let { users } = useUsers({ user_id });
  let online_users;
  if (users.length) {
    online_users = chat.users.map((ul) => ({ ...ul, is_active: users.includes(ul.id) }));
  } // хз почему ломается от обычного else
  if (!users) {
    online_users = chat.users.map((ul) => ({ ...ul, is_active: false }));
  }

  return (
    <Grid container direction="row" justifyContent="center" alignItems="flex-start" spacing={{ xs: 12 }}>
      <Grid item xs={2}>
        <UserList className="user list" users={online_users} />
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
  );
};
