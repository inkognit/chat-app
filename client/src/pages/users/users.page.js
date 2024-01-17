import { useState, useEffect } from 'react';
import { axiosAPI } from '../../hooks/api';
import UserList from '../../components/chat_room/user_list/user_list.component';

export default function UsersPage() {
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
  }, []);

  return <UserList users={users} />;
}
