import { useEffect, useState } from 'react';
import { TextField } from '@mui/material';
import storage from '../../utils/storage';
import { axiosAPI } from '../../hooks/api';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import { routes } from '../../routes/routes';

export const SignInPage = () => {
  // начальные данные
  const [formData, setFormData] = useState({
    login: '',
      password: '',
  });

  const [submitDisabled, setSubmitDisabled] = useState(true);

  useEffect(() => {
    const isSomeFieldEmpty = Object.values(formData).some((v) => !v.trim());
    setSubmitDisabled(isSomeFieldEmpty);
  }, [formData]);

  const onChange = ({ target: { name, value } }) => {
    setFormData({ [name]: value });
  };

  const onSubmit = async (e) => {
    e.preventDefault();
    if (submitDisabled) return;
    const data = await axiosAPI({
      link: 'http://localhost:3000/api/sign-in',
      method: 'GET',
      params: { name: formData.login },
    });

    if (data && !data.message && data[0].id) {
      storage.set(process.env.REACT_APP_USER_KEY || 'chat_app_user', {
        user_id: data[0].id,
        login: formData.login,
      });
    }

    window.location.reload();
  };

  return (
    <Grid container direction="row" justifyContent="center" alignItems="center" sx={{ height: '100%' }}>
      <Grid container direction="column" xs={3} margin={3}>
        <Typography
          id="welcome"
          textAlign="center"
          variant="h6"
          sx={{
            fontFamily: 'monospace',
            color: 'inherit',
            textDecoration: 'none',
          }}
        >
          Welcome
        </Typography>
        <TextField label="login" id="login" required size="small" value={formData.login} onChange={onChange} />

        <TextField label="password" id="password" required size="small" value={formData.password} onChange={onChange} />
        <Grid container direction="row" justifyContent="center" alignItems="center" margin={3}>
          <Grid xs={3}>
            <Button variant="contained" href={routes.main} onClick={onSubmit}>
              login
            </Button>
          </Grid>
          <Grid xs={3}>
            <Button variant="contained" href={routes.sign_up}>
              registration
            </Button>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
  );
};
