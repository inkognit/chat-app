import { useEffect, useState } from 'react';
import { TextField } from '@mui/material';
import storage from '../../utils/storage';
import { axiosAPI } from '../../api/api';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import { routes } from '../../routes/routes';
import IconButton from '@mui/material/IconButton';
import OutlinedInput from '@mui/material/OutlinedInput';
import InputLabel from '@mui/material/InputLabel';
import InputAdornment from '@mui/material/InputAdornment';
import FormControl from '@mui/material/FormControl';
import Visibility from '@mui/icons-material/Visibility';
import VisibilityOff from '@mui/icons-material/VisibilityOff';

export const SignInPage = () => {
  const [showPassword, setShowPassword] = useState(false);
  const [formData, setFormData] = useState({
    login: '',
    password: '',
  });
  const [submitDisabled, setSubmitDisabled] = useState(true);

  const handleClickShowPassword = () => setShowPassword((show) => !show);
  const handleMouseDownPassword = (event) => {
    event.preventDefault();
  };

  useEffect(() => {
    const isSomeFieldEmpty = Object.values(formData).some((v) => !v.trim() || v.length < 3);
    setSubmitDisabled(isSomeFieldEmpty);
  }, [formData]);

  const onChange = ({ target: { name, value } }) => {
    setFormData({ ...formData, [name]: value });
  };

  const onSubmit = async (e) => {
    e.preventDefault();
    if (submitDisabled) return;
    alert(process.env.REACT_APP_SERVER_HOST + ':' + process.env.REACT_APP_SERVER_PORT);
    const { data } = await axiosAPI({
      to: `auth/sign-in`,
      method: 'POST',
      body: { input_prop: formData.login, password: formData.password },
    });

    if (data && !data.message) {
      storage.set(process.env.REACT_APP_USER_KEY || 'chat_app_user', data.user);
      storage.set('chat_app_user_authorization', data.access_token);
    }

    window.location.reload();
  };

  return (
    <Grid container direction="column" justifyContent="center" alignItems="center" sx={{ height: '100%' }}>
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

      <FormControl sx={{ m: 1, width: '25ch' }} variant="outlined">
        <TextField
          label="login"
          name="login"
          id="login"
          required
          size="small"
          value={formData.login}
          onChange={onChange}
        />
      </FormControl>
      <FormControl sx={{ m: 1, width: '25ch' }} variant="outlined">
        <InputLabel htmlFor="outlined-adornment-password" size="small">
          Password
        </InputLabel>
        <OutlinedInput
          type={showPassword ? 'text' : 'password'}
          name="password"
          id="password"
          label="password"
          required
          size="small"
          value={formData.password}
          onChange={onChange}
          endAdornment={
            <InputAdornment position="end">
              <IconButton
                aria-label="toggle password visibility"
                onClick={handleClickShowPassword}
                onMouseDown={handleMouseDownPassword}
                edge="end"
              >
                {showPassword ? <VisibilityOff /> : <Visibility />}
              </IconButton>
            </InputAdornment>
          }
        />
      </FormControl>

      <FormControl sx={{ m: 1, width: '300px' }} variant="outlined">
        <Grid item alignItems="center" xs={3}>
          <Button variant="contained" href={routes.main} onClick={onSubmit} disabled={submitDisabled}>
            login
          </Button>
        </Grid>
        <Grid xs={3}>
          <Button variant="contained" href={routes.sign_up}>
            registration
          </Button>
        </Grid>
      </FormControl>
    </Grid>
  );
};
