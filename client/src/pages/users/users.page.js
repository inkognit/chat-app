import { useState, useEffect } from 'react';
import { axiosAPI } from '../../api/api';
import { UserList } from '../../components/users/user_list.component';
import { Loader } from '../../components/general/loader.component';

export const UsersPage = ({ online_users }) => {
  const [users, setUsers] = useState([]);
  const [loader, setLoader] = useState(true);

  useEffect(() => {
    (async () => {
      try {
        setLoader(true);
        const data = await axiosAPI({
          to: `users`,
          method: 'GET',
        });
        if (data) {
          setUsers(data);
        }
      } catch (err) {
        console.log(err);
      } finally {
        setLoader(false);
      }
    })();
  }, []);

  useEffect(() => {
    (async () => {
      try {
        if (users.length) {
          setUsers(users.map((ul) => ({ ...ul, is_active: online_users.includes(ul.id) })));
        }
      } catch (err) {
        console.log(err);
      }
    })();
  }, [online_users, users]);

  if (loader) {
    return <Loader />;
  }

  return <UserList users={users} online_users={online_users} />;
};
