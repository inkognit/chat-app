import useChat from '../../hooks/useChat';
import MessageInput from '../chat_room/message_input/message_input';
import MessageList from '../chat_room/message_list/message_list';
import UserList from '../chat_room/user_list/user_list';

export const Room = () => {
  // получаем список пользователей, список сообщений, системную информацию и методы для отправки и удаления сообщения
  const { users, messages, log, sendMessage, removeMessage } = useChat();
  // и передаем их соответствующим компонентам
  return (
    <div className="container chat">
      <div className="container message">
        <MessageList log={log} messages={messages} removeMessage={removeMessage} />
        <MessageInput sendMessage={sendMessage} />
      </div>
      <UserList users={users} />
    </div>
  );
};
