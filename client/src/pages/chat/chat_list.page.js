import { useState, useEffect } from 'react';
import Grid from '@mui/material/Grid';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import { axiosAPI } from '../../api/api';
import Typography from '@mui/material/Typography';
import { routes } from '../../routes/routes';
import { session } from '../../utils/session';
import { ListItemLink } from '../../components/general/lists.component';
import { Loader } from '../../components/general/loader.component';

export const ChatListPage = () => {
  const user = session;
  const [loader, setLoader] = useState(false);
  const [chats, setChats] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        setLoader(true);
        const data = await axiosAPI({
          to: `chats`,
          method: 'GET',
          params: { user_id: user.id },
        });

        setChats(data);
      } catch (err) {
        console.log(err);
      } finally {
        setLoader(false);
      }
    }
    fetchData();
  }, [user.id]);

  if (loader) {
    return <Loader />;
  }

  return (
    <Grid container justifyContent="center" alignItems="flex-start">
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
                <ListItemText primary={title} secondary="" />
              </ListItemLink>
            </ListItem>
          ))}
        </List>
      </Grid>
    </Grid>
  );
};
