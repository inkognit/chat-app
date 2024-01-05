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

export const ChatPage = () => {
  const { chat_id } = useParams();
  const { user_id } = session;
  const [chat, setChat] = useState([]);
  const { messages, log, sendMessage, removeMessage } = useChat({ user_id, chat_id });
  useEffect(() => {
    async function fetchData() {
      try {
        const { data } = await axiosAPI({
          link: `http://localhost:3000/api/chats/${chat_id}`,
          method: 'GET',
          params: { chat_id, user_id },
        });
        setChat(data)
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, []);
  let { users } = useUsers({ user_id });
  if (users.length) {
    users = chat.users.map((ul) => ({ ...ul, is_active: users.includes(ul.id) }));
  }

  return (
    <div className="container chat">
      <div className="container message">
        <MessageList log={log} messages={messages} removeMessage={removeMessage} chat_id={chat_id} />
        <MessageInput sendMessage={sendMessage} chat_id={chat_id} />
      </div>
      <UserList users={users} />
      {/* <Chat users={users} /> */}
    </div>
  );
};
