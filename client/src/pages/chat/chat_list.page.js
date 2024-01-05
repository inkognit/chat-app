import { useState, useEffect } from 'react';
import List from '@mui/material/List';
import Paper from '@mui/material/Paper';
import { axiosAPI } from '../../hooks/api';
import Typography from '@mui/material/Typography';
import { styled } from '@mui/material/styles';
import { ButtonLink } from '../../components/appbar/menu-button.component';
import { routes } from '../../routes/routes';
import { session } from '../../hooks/session';
import Box from '@mui/material/Box';
// import useUsers from '../../hooks/useUsers';

const DemoPaper = styled(Paper)(({ theme }) => ({
  width: 120,
  height: 15,
  margin: 5,
  padding: theme.spacing(2),
  ...theme.typography.body2,
  textAlign: 'center',
}));

export const ChatListPage = () => {
  const { user_id } = session;
  const [chats, setChats] = useState([]);
  // const { users } = useUsers({ user_id });

  useEffect(() => {
    async function fetchData() {
      try {
        const { data } = await axiosAPI({
          link: 'http://localhost:3000/api/chats',
          method: 'GET',
          params: { user_id },
        });

        setChats(data);
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, []);

  return (
    <List className="container chats" sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
      <Box component="ul" className="list chat">
        <h2>Chats</h2>
        {chats.map(({ id, title }) => (
          <DemoPaper
            key={id}
            variant="elevation"
            // component="a"
          >
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
      </Box>
    </List>
  );
};
