// import fileApi from '../../../api/file.api';
// import useStore from '../../../hooks/useStore';
// import { useEffect, useRef, useState } from 'react';
// import { FiSend } from 'react-icons/fi';
// import EmojiMart from '../message_input/emoji_mart/emoji_mart';
// import FileInput from './file_input/file_input';
// import Recorder from './recorder/recorder';
// import { session } from '../../../hooks/session';

// export default function MessageInputOLD({ sendMessage, chat_id }) {
//     const { id: user_id } = session

//   const state = useStore((state) => state);
//   const { file, setFile, showPreview, setShowPreview, showEmoji, setShowEmoji } = state;

//   const [text, setText] = useState('');
//   // локальное состояние блокировки кнопки
//   const [submitDisabled, setSubmitDisabled] = useState(true);
//   // иммутабельная ссылка на инпут для ввода текста сообщения
//   const inputRef = useRef();

//   // для отправки сообщения требуется либо текст сообщения, либо файл
//   useEffect(() => {
//     setSubmitDisabled(!text.trim() && !file);
//   }, [text, file]);

//   // отображаем превью при наличии файла
//   useEffect(() => {
//     setShowPreview(file);
//   }, [file, setShowPreview]);

//   const onSubmit = async (e) => {
//     e.preventDefault();
//     if (submitDisabled) return;

//     let message = {
//       user_id,
//       chat_id,
//     };

//     if (!file) {
//       // типом сообщения является текст
//       message.type = 'text';
//       message.text = text;
//     } else {
//       // типом сообщения является файл
//       try {
//         // загружаем файл на сервер и получаем относительный путь к нему
//         const path = await fileApi.upload({ file, chat_id });
//         // получаем тип файла
//         const type = file.type.split('/')[0];


//         message.type = type;
//         message.text = path;
//       } catch (e) {
//         console.error(e);
//       }
//     }

//     // скрываем компонент с эмодзи, если он открыт
//     if (showEmoji) {
//       setShowEmoji(false);
//     }

//     // отправляем сообщение
//     sendMessage(message);

//     // сбрасываем состояние
//     setText('');
//     setFile(null);
//   };

//   return (
//     <form onSubmit={onSubmit} className="form message">
//       <EmojiMart setText={setText} messageInput={inputRef.current} />
//       <FileInput />
//       <Recorder />
//       <input
//         type="text"
//         autoFocus
//         placeholder="Message..."
//         value={text}
//         onChange={(e) => setText(e.target.value)}
//         ref={inputRef}
//         // при наличии файла вводить текст нельзя
//         disabled={showPreview}
//       />
//       <button className="btn" type="submit" disabled={submitDisabled}>
//         <FiSend className="icon" />
//       </button>
//     </form>
//   );
// }
