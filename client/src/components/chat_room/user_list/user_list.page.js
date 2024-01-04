import { AiOutlineUser } from 'react-icons/ai';

export default function UserList({ users }) {
  console.log(users);
  return (
    <div className="container user">
      <h2>Users</h2>
      <ul className="list user">
        {users.map(({ id, name }) => (
          <li key={id} className="item user">
            <AiOutlineUser className="icon user" />
            {name}
          </li>
        ))}
      </ul>
    </div>
  );
}
