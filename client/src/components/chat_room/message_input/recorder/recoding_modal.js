import useStore from '../../../../hooks/useStore';
import { useRef, useState } from 'react';
import { BsFillPauseFill, BsFillPlayFill, BsFillStopFill } from 'react-icons/bs';
import {
  audioConstraints,
  isRecordingStarted,
  pauseRecording,
  resumeRecording,
  startRecording,
  stopRecording,
  videoConstraints,
} from '../../../../utils/recording';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';

export default function RecordingModal({ setShowModal }) {
  // извлекаем метод для обновления файла из хранилища
  const setFile = useStore(({ setFile }) => setFile);
  // локальное состояние для требований к потоку данных
  // по умолчанию создается аудиозапись
  const [constraints, setConstraints] = useState(audioConstraints);
  // локальный индикатор начала записи
  const [recording, setRecording] = useState(false);
  // иммутабельная ссылка на элемент для выбора типа записи
  const selectBlockRef = useRef();
  // иммутабельная ссылка на элемент `video`
  const videoRef = useRef();

  // функция для обновления требований к потоку на основе типа записи
  const onChange = ({ target: { value } }) =>
    value === 'audio' ? setConstraints(audioConstraints) : setConstraints(videoConstraints);

  // функция для приостановки/продолжения записи
  const pauseResume = () => {
    if (recording) {
      pauseRecording();
    } else {
      resumeRecording();
    }
    setRecording(!recording);
  };

  // функция для начала записи
  const start = async () => {
    if (isRecordingStarted()) {
      return pauseResume();
    }

    // получаем поток
    const stream = await startRecording(constraints);

    // обновляем локальный индикатор начала записи
    setRecording(true);

    // скрываем элемент для выбора типа записи
    selectBlockRef.current.style.display = 'none';

    // если создается видеозапись
    if (constraints.video && stream) {
      videoRef.current.style.display = 'block';
      // направляем поток в элемент `video`
      videoRef.current.srcObject = stream;
    }
  };

  // функция для завершения записи
  const stop = () => {
    // получаем файл
    const file = stopRecording();

    // обновляем локальный индикатор начала записи
    setRecording(false);

    // обновляем файл
    setFile(file);

    // скрываем модалку
    setShowModal(false);
  };

  return (
    <Container
      className="overlay"
      onClick={(e) => {
        // скрываем окно при клике за его пределами
        if (e.target.className !== 'overlay') return;
        setShowModal(false);
      }}
    >
      <Container className="modal">
        <Container ref={selectBlockRef}>
          <h2>Select type</h2>
          <select onChange={onChange}>
            <option value="audio">Audio</option>
            <option value="video">Video</option>
          </select>
        </Container>

        {/* вот для чего нам нужны 2 индикатора начала записи */}
        {isRecordingStarted() && <Typography>{recording ? 'Recording...' : 'Paused'}</Typography>}

        <video ref={videoRef} autoPlay muted />

        <Container className="controls">
          <button className="btn play" onClick={start}>
            {recording ? <BsFillPauseFill className="icon" /> : <BsFillPlayFill className="icon" />}
          </button>
          {isRecordingStarted() && (
            <button className="btn stop" onClick={stop}>
              <BsFillStopFill className="icon" />
            </button>
          )}
        </Container>
      </Container>
    </Container>
  );
}
