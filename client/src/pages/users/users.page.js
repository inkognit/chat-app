import { useState, useEffect } from 'react';
import { axiosAPI } from '../../hooks/api';
import UserList from '../../components/chat_room/user_list/user_list.component';
// import storage from '../../utils/storage';
// import useUsers from '../../hooks/useUsers';

export default function UsersPage() {
  // { online_users }
  // const user = storage.get(process.env.REACT_APP_USER_KEY || 'chat_app_user');
  // const { ConnectUser, users: onlines } = useUsers({ user_id: user ? user.id : 0 });
  // ConnectUser({ user_id: user.id });
  // console.log(JSON.stringify(onlines));
  //  const { connectUser } = useSocket({ user_id: user ? user.id : null });

  const [users, setUsers] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const data = await axiosAPI({
          link: 'http://localhost:3000/api/users',
          method: 'GET',
        });
        if (data) {
          setUsers(data.map((ul) => ({ ...ul, is_active: users.includes(ul.id) })));
        }
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, [users]);

  return <UserList users={users} />;
}
