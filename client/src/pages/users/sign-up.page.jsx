import { useState } from 'react';
import { axiosAPI } from '../../api/api';
import Grid from '@mui/material/Grid';
import Input from '@mui/material/Input';
import Button from '@mui/material/Button';
import { Loader } from '../../components/general/loader.component';

export const SignUpPage = () => {
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    password: '',
    login: '',
    email: '',
    first_name: '',
    last_name: '',
    middle_name: '',
  });

  const onChange = ({ target: { name, value } }) => {
    setFormData({ ...formData, [name]: value });
  };

  const onSubmit = async (e) => {
    try {
      e.preventDefault();
      setLoading(true);
      await axiosAPI({
        to: 'sign-up',
        method: 'POST',
        body: formData,
      });
      // + auth
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <Loader />;

  return (
    <Grid
      container
      margin={2}
      position="absolute"
      top="40%"
      width="40%"
      direction="row"
      justifyContent="center"
      alignItems="center"
    >
      <Grid container>
        <Grid item xs={6}>
          <Input placeholder="login" value={formData.login} onChange={onChange} />
        </Grid>
        <Grid item xs={6}>
          <Input placeholder="password" value={formData.password} onChange={onChange} />
        </Grid>
        <Grid item xs={6}>
          <Input placeholder="email" value={formData.email} onChange={onChange} />
        </Grid>
        <Grid item xs={6}>
          <Input placeholder="first_name" value={formData.first_name} onChange={onChange} />
        </Grid>
        <Grid item xs={6}>
          <Input placeholder="last_name" value={formData.last_name} onChange={onChange} />
        </Grid>
        <Grid item xs={6}>
          <Input placeholder="middle_name" value={formData.middle_name} onChange={onChange} />
        </Grid>
        <Grid item xs={12}>
          <Button variant="text" onClick={onSubmit} href="/">
            Sign up
          </Button>
        </Grid>
      </Grid>
    </Grid>
  );
};
