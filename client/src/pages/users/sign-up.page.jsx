import { useState } from 'react';
import { axiosAPI } from '../../api/api';
import Grid from '@mui/material/Grid';
import Input from '@mui/material/Input';
import Button from '@mui/material/Button';
import Paper from '@mui/material/Paper';
import Container from '@mui/material/Container';
import { makeStyles } from '@material-ui/core/styles';
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
  //   const useStyles = makeStyles({
  //     root: {
  //       background: (props) =>
  //         props.color === 'red'
  //           ? 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)'
  //           : 'linear-gradient(45deg, #2196F3 30%, #21CBF3 90%)',
  //       border: 0,
  //       borderRadius: 3,
  //       boxShadow: (props) =>
  //         props.color === 'red' ? '0 3px 5px 2px rgba(255, 105, 135, .3)' : '0 3px 5px 2px rgba(33, 203, 243, .3)',
  //       color: 'white',
  //       height: 48,
  //       padding: '0 30px',
  //       margin: 8,
  //       }, main: {
  //         background: 'linear-gradient(45deg, #2196F3 30%, #21CBF3 90%)'
  //     }
  //   });
  //   const styles = useStyles();

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
    // <main>
    //   <Paper className={styles.main} style={{ background: 'url(https://source.unsplash.com/random)' }}>
    <Container fixed>
      <Grid
        container
        margin={2}
        position="absolute"
        top="40%"
        // width="40%"
        direction="row"
        justifyContent="center"
        alignItems="center"
      >
        <Grid item md={6}>
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
    </Container>
    //   </Paper>
    // </main>
    // <Grid
    //   container
    //   margin={2}
    //   position="absolute"
    //   top="40%"
    //   width="40%"
    //   direction="row"
    //   justifyContent="center"
    //   alignItems="center"
    // >
    //   <Grid container>
    //     <Grid item xs={6}>
    //       <Input placeholder="login" value={formData.login} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={6}>
    //       <Input placeholder="password" value={formData.password} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={6}>
    //       <Input placeholder="email" value={formData.email} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={6}>
    //       <Input placeholder="first_name" value={formData.first_name} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={6}>
    //       <Input placeholder="last_name" value={formData.last_name} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={6}>
    //       <Input placeholder="middle_name" value={formData.middle_name} onChange={onChange} />
    //     </Grid>
    //     <Grid item xs={12}>
    //       <Button variant="text" onClick={onSubmit} href="/">
    //         Sign up
    //       </Button>
    //     </Grid>
    //   </Grid>
    // </Grid>
  );
};
