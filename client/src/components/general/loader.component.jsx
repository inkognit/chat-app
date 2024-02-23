import { BallTriangle } from 'react-loader-spinner';
import Grid from '@mui/material/Grid';

export const Loader = () => {
  return (
    <Grid container justifyContent="center" alignItems="center" top="50%" position="absolute">
      <BallTriangle
        height="100"
        width="100"
        radius="5"
        color="#34ebe5"
        ariaLabel="three-dots-loading"
        wrapperStyle
        wrapperClass
      />
    </Grid>
  );
};
