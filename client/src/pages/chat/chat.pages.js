import useChat from '../../hooks/useChat';
import MessageInput from '../../components/chat_room/message_input/message_input';
import MessageList from '../../components/chat_room/message_list/message_list';
// import UserList from './user_list/user_list.page';
import storage from '../../utils/storage';
import { useParams } from 'react-router';

export const ChatPage = () => {
  const { chat_id } = useParams();
  const { user_id } = storage.get(process.env.REACT_APP_USER_KEY);
  const { messages, log, sendMessage, removeMessage } = useChat({ user_id, chat_id });
  console.log('🚀 ~ file: chat.pages.js:12 ~ ChatPage ~ messages:', messages);

  return (
    <div className="container chat">
      <div className="container message">

        <MessageList log={log} messages={messages} removeMessage={removeMessage} chat_id={chat_id} />
        <MessageInput sendMessage={sendMessage} chat_id={chat_id} /> 
      </div>
      {/* <UserList users={users} /> */}
    </div>
  );
};
