import TextField from '@mui/material/TextField';

import useStore from '../../../hooks/useStore';
import { useEffect, useState } from 'react';
import { session } from '../../../hooks/session';
import SendIcon from '@mui/icons-material/Send';
import Button from '@mui/material/Button';
import Grid from '@mui/material/Grid';

export default function MessageInputNEW({ sendMessage, chat_id }) {
  const { id: user_id } = session;
  const state = useStore((state) => state);
  const { setFile, showEmoji, setShowEmoji } = state;
  const [text, setText] = useState('');
  const [submitDisabled, setSubmitDisabled] = useState(true);

  useEffect(() => {
    setSubmitDisabled(!text.trim());
  }, [text]);

  const onSubmit = async (e) => {
    e.preventDefault();
    if (submitDisabled) return;

    let message = {
      user_id,
      chat_id,
    };

    message.type = 'text';
    message.text = text;

    if (showEmoji) {
      setShowEmoji(false);
    }
    sendMessage(message);
    setText('');
    setFile(null);
  };

  return (
    <Grid item xs={12} sx={{ maxWidth: 360 }}>
      <TextField
        id="outlined-multiline-static"
        value={text}
        multiline
        rows={1}
        variant="outlined"
        onChange={(e) => setText(e.target.value)}
        sx={{ width: '72%', bgcolor: '#fafaf5', borderRadius: '20px' }}
      />
      <Button
        variant="contained"
        endIcon={<SendIcon />}
        type="submit"
        disabled={submitDisabled}
        onClick={onSubmit}
        sx={{ width: '28%' }}
      >
        Send
      </Button>
    </Grid>
  );
}
