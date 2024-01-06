import useChat from '../../hooks/useChat';
import MessageInput from '../../components/chat_room/message_input/message_input';
import MessageList from '../../components/chat_room/message_list/message_list';
// import Chat from './user_list/user_list.page';
import { useParams } from 'react-router';
import { session } from '../../hooks/session';
import { useEffect, useState } from 'react';
import { axiosAPI } from '../../hooks/api';
import useUsers from '../../hooks/useUsers';
import UserList from '../../components/chat_room/user_list/user_list.page';
import Container from '@mui/material/Container';

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
    <Container className="container chat">
      <MessageList
        className="message list"
        log={log}
        messages={messages}
        removeMessage={removeMessage}
        chat_id={chat_id}
      />
      <MessageInput className="message input" sendMessage={sendMessage} chat_id={chat_id} />

      <UserList className="user list" users={online_users} />
    </Container>
  );
};
