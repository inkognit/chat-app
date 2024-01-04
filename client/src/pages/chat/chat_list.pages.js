import { useState, useEffect } from 'react';
import Paper from '@mui/material/Paper';
import { axiosAPI } from '../../hooks/api';
import Typography from '@mui/material/Typography';
import { styled } from '@mui/material/styles';
import { ButtonLink } from '../../components/appbar/menu-button.component';
import { routes } from '../../routes/routes';

const DemoPaper = styled(Paper)(({ theme }) => ({
  width: 120,
  height: 15,
  margin: 5,
  padding: theme.spacing(2),
  ...theme.typography.body2,
  textAlign: 'center',
}));

export const ChatListPage = () => {
  const [chats, setChats] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const { data } = await axiosAPI({
          link: 'http://localhost:3000/api/chats',
          method: 'GET',
          params: { user_id: 1 },
        });

        setChats(data);
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, []);

  return (
    <div className="container chats">
      <h2>Chats</h2>
      <ul className="list chat">
        {chats.map(({ id, title }) => (
          <DemoPaper variant="elevation" noWrap component="a">
            <ButtonLink to={routes.chat + `${id}`} size="large">
              <Typography
                key={id}
                textAlign="center"
                variant="h6"
                sx={{
                  fontFamily: 'monospace',
                  color: 'inherit',
                  textDecoration: 'none',
                }}
              >
                {title}
              </Typography>
            </ButtonLink>
          </DemoPaper>
        ))}
      </ul>
    </div>
  );
};
