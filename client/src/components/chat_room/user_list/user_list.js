import { AiOutlineUser } from 'react-icons/ai';

export default function UserList({ users }) {
  return (
    <div className="container user">
      <h2>Users</h2>
      <ul className="list user">
        {users.map(({ user_id, user_name }) => (
          <li key={user_id} className="item user">
            <AiOutlineUser className="icon user" />
            {user_name}
          </li>
        ))}
      </ul>
    </div>
  );
}
