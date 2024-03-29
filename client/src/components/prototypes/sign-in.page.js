// import { useEffect, useState } from 'react';
// import { TextField } from '@mui/material';
// import storage from '../../utils/storage';
// import { axiosAPI } from '../../hooks/api';
// import Container from '@mui/material/Container';

// export const SignInPage = () => {

//   const [formData, setFormData] = useState({
//     user_name: '',
//   });

//   const [submitDisabled, setSubmitDisabled] = useState(true);

//   // все поля формы являются обязательными
//   useEffect(() => {
//     const isSomeFieldEmpty = Object.values(formData).some((v) => !v.trim());
//     setSubmitDisabled(isSomeFieldEmpty);
//   }, [formData]);

//   // функция для изменения данных
//   const onChange = ({ target: { name, value } }) => {
//     setFormData({ ...formData, [name]: value });
//   };

//   // функция для отправки формы
//   const onSubmit = async (e) => {
//     e.preventDefault();
//     if (submitDisabled) return;
//     const data = await axiosAPI({
//       link: `http://${process.env.REACT_APP_SERVER_HOST}:${process.env.REACT_APP_SERVER_PORT}/api/users`,
//       method: 'GET',
//       params: { name: formData.user_name },
//     });
//     console.log(data);
//     if (data && !data.message && data[0].id) {
//       storage.set(process.env.REACT_APP_USER_KEY || 'chat_app_user', {
//         user_id: data[0].id,
//         user_name: formData.user_name,
//       });
//     }

//     window.location.reload();
//   };

//   return (
//     <Container className="container name-input">
//       <h2>Welcome</h2>
//       <form onSubmit={onSubmit} className="form name-room">
//         <Container>
//           <label htmlFor="user_name">Enter your name</label>
//           <TextField
//             type="text"
//             id="user_name"
//             name="user_name"
//             minLength={2}
//             required
//             value={formData.user_name}
//             onChange={onChange}
//           />
//         </Container>
//         {/* скрываем поле для создания комнаты (возможность масштабирования) */}
//         <button disabled={submitDisabled} className="btn chat">
//           login
//         </button>
//       </form>
//     </Container>
//   );
// };
