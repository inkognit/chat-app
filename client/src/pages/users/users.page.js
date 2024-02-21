import { useState, useEffect } from 'react';
import { axiosAPI } from '../../api/api';
import UserList from '../../components/chat_room/user_list/user_list.component';

export default function UsersPage({ online_users }) {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const data = await axiosAPI({
          link: `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/users`,
          method: 'GET',
        });
        if (data) {
          setUsers(data.map((ul) => ({ ...ul, is_active: online_users.includes(ul.id) })));
        }
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, [online_users, users]);

  return <UserList users={users} online_users={online_users} />;
}
