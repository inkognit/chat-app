// импорты

import { nanoid } from 'nanoid';
import { useEffect, useState } from 'react';
import storage from '../../utils/storage';

export const NameInput = () => {
  // начальные данные
  const [formData, setFormData] = useState({
    user_name: '',
    // фиксируем ("хардкодим") название (идентификатор) комнаты
    chat_id: 'main_room',
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
  const onSubmit = (e) => {
    e.preventDefault();
    if (submitDisabled) return;

    // генерируем идентификатор пользователя
    const user_id = nanoid();

    // записываем данные пользователя в локальное хранилище
    storage.set(process.env.USER_KEY, {
      user_id,
      user_name: formData.user_name,
      chat_id: formData.chat_id,
    });

    // перезагружаем приложение для того, чтобы "попасть" в комнату
    window.location.reload();
  };

  return (
    <div className="container name-input">
      <h2>Welcome</h2>
      <form onSubmit={onSubmit} className="form name-room">
        <div>
          <label htmlFor="user_name">Enter your name</label>
          <input
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
        <div class="visually-hidden">
          <label htmlFor="chat_id">Enter room ID</label>
          <input
            type="text"
            id="chat_id"
            name="chat_id"
            minLength={4}
            required
            value={formData.chat_id}
            onChange={onChange}
          />
        </div>
        <button disabled={submitDisabled} className="btn chat">
          Chat
        </button>
      </form>
    </div>
  );
};
