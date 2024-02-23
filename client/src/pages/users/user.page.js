import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import { useEffect, useState } from 'react';
import { axiosAPI } from '../../api/api';
import { session } from '../../utils/session';
import { useParams } from 'react-router';

export const UserPage = () => {
  const [user, setUser] = useState({});
  // const [isEdit, setIsEdit] = useState(false);
  const { user_id } = useParams();
  const { id: session_user_id } = session;
  const isOwner = session_user_id === user_id;

  useEffect(() => {
    (async () => {
      try {
        const data = await axiosAPI({
          to: `users/${user_id}`,
          method: 'GET',
        });
        if (data) {
          setUser(data);
        }
      } catch (err) {
        console.log(err);
      }
    })();
  }, [user_id]);
  return (
    <Grid container>
      <Typography>{JSON.stringify(user)}</Typography>
    </Grid>
  );
};
