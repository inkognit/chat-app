import { NameInput } from '../../components/name_input/name_input';
import { Room } from '../../components/chat_room/chat_room';
import storage from '../../utils/storage';

export const Home = () => {
  const user = storage.get(process.env.USER_KEY);

  return user ? <Room /> : <NameInput />;
};
