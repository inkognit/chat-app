import { useEffect, useState } from 'react';
import { TextField } from '@mui/material';
import storage from '../../utils/storage';
import { axiosAPI } from '../../hooks/api';

export const SignInPage = () => {
  // начальные данные
  const [formData, setFormData] = useState({
    user_name: '',
  });
  // состояние блокировки кнопки
  const [submitDisabled, setSubmitDisabled] = useState(true);

  // все поля формы являются обязательными
  useEffect(() => {
    const isSomeFieldEmpty = Object.values(formData).some((v) => !v.trim());
    setSubmitDisabled(isSomeFieldEmpty);
  }, [formData]);

  // функция для изменения данных
  const onChange = ({ target: { name, value } }) => {
    setFormData({ ...formData, [name]: value });
  };

  // функция для отправки формы
  const onSubmit = async (e) => {
    e.preventDefault();
    if (submitDisabled) return;
    const { data } = await axiosAPI({
      link: 'http://localhost:3000/api/users',
      method: 'GET',
      params: { name: formData.user_name },
    });

    if (data[0].id) {
      storage.set(process.env.REACT_APP_USER_KEY || 'chat_app_user', {
        user_id: data[0].id,
        user_name: formData.user_name,
      });
    }

    window.location.reload();
  };

  return (
    <div className="container name-input">
      <h2>Welcome</h2>
      <form onSubmit={onSubmit} className="form name-room">
        <div>
          <label htmlFor="user_name">Enter your name</label>
          <TextField
            type="text"
            id="user_name"
            name="user_name"
            minLength={2}
            required
            value={formData.user_name}
            onChange={onChange}
          />
        </div>
        {/* скрываем поле для создания комнаты (возможность масштабирования) */}
        <button disabled={submitDisabled} className="btn chat">
          login
        </button>
      </form>
    </div>
  );
};
