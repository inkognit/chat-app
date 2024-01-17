import { useState, useEffect } from 'react';
import Grid from '@mui/material/Grid';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
// import ListItemAvatar from '@mui/material/ListItemAvatar';
// import Paper from '@mui/material/Paper';
import { axiosAPI } from '../../hooks/api';
import Typography from '@mui/material/Typography';
// import { styled } from '@mui/material/styles';
// import { ButtonLink } from '../../components/appbar/menu-button.component';
import { routes } from '../../routes/routes';
import { session } from '../../hooks/session';
// import Box from '@mui/material/Box';
import { ListItemLink } from '../../components/general/lists.component';
// import useUsers from '../../hooks/useUsers';

// const DemoPaper = styled(Paper)(({ theme }) => ({
//   width: 120,
//   height: 15,
//   margin: 5,
//   padding: theme.spacing(2),
//   ...theme.typography.body2,
//   textAlign: 'center',
// }));

export const ChatListPage = () => {
  const  user  = session;
  const [chats, setChats] = useState([]);
  // const { users } = useUsers({ user_id });

  useEffect(() => {
    async function fetchData() {
      try {
        const data = await axiosAPI({
          link: 'http://localhost:3000/api/chats',
          method: 'GET',
          params: { user_id: user.id },
        });

        setChats(data);
      } catch (err) {
        console.log(err);
      }
    }
    fetchData();
  }, [user.id]);

  return (
    <Grid container direction="row" justifyContent="center" alignItems="flex-start">
      <Grid item xs={2}>
        <Typography variant="h4" component="h4">
          Chats
        </Typography>
        <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
          {chats.map(({ id, title }) => (
            <ListItem
              sx={{
                width: '100%',
                maxWidth: 150,
                bgcolor: '#07c2db',
                borderRadius: '20px',
                mb: 1,
              }}
            >
              <ListItemLink to={routes.chat + `${id}`} size="large">
                {/* <Typography
                key={id}
                textAlign="center"
                variant="h6"
                sx={{
                  fontFamily: 'monospace',
                  color: 'inherit',
                  textDecoration: 'none',
                }}
              > */}
                <ListItemText primary={title} secondary="" />
                {/* </Typography> */}
              </ListItemLink>
            </ListItem>
          ))}
        </List>
      </Grid>
    </Grid>
  );
};
