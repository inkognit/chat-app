import Typography from '@mui/material/Typography';
import MenuItem from '@mui/material/MenuItem';
import Button from '@material-ui/core/Button';

import React from 'react';
import { Link } from 'react-router-dom';

export default function MenuButton({ to, title }) {
  return (
    <MenuItem component="a" href={to}>
      <Typography
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
    </MenuItem>
  );
}

export const ButtonLink = (props) => (
  <Button component={Link } {...props} />
)