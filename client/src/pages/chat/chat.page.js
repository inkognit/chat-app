import useChatMessages from '../../hooks/useChatMessages';
import MessageList from '../../components/chat_room/message_list/message_list';
import { useParams } from 'react-router';
import { session } from '../../utils/session';
import { useEffect, useState } from 'react';
import Typography from '@mui/material/Typography';
import { axiosAPI } from '../../api/api';
import Grid from '@mui/material/Grid';
import MessageInputNEW from '../../components/chat_room/message_input/message_input.component';
import { Loader } from '../../components/general/loader.component';
import { UserList } from '../../components/users/user_list.component';

export const ChatPage = ({ online_users: online }) => {
  const [chat, setChat] = useState({});
  const [users, setUsers] = useState([]);
  const [loader, setLoader] = useState(false);

  const { chat_id } = useParams();
  const { id: user_id } = session;

  const { messages, sendMessage, removeMessage } = useChatMessages({ user_id, chat_id });

  useEffect(() => {
    (async () => {
      try {
        setLoader(true);
        const { users, ...chat } = await axiosAPI({
          to: `chats/${chat_id}`,
          method: 'GET',
          params: { user_id },
        });
        setChat(chat);

        setUsers(users.map((ul) => ({ ...ul, is_active: online.includes(ul.id) })));
      } catch (err) {
        console.log(err);
      } finally {
        setLoader(false);
      }
    })();
  }, [chat_id, online, user_id]);


  if (loader) {
    return <Loader />;
  }

  return (
    <Grid container direction="column" justifyContent="center" alignItems="center">
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
          />

          <MessageInputNEW className="message input" sendMessage={sendMessage} chat_id={chat_id} />
        </Grid>
      </Grid>
    </Grid>
  );
};
