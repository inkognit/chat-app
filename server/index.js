import cors from 'cors';
import express from 'express';
import { createServer } from 'http';
import { Server } from 'socket.io';
import onConnection from './services/socket_io.js';
import routes from './routes/routes.js';
import cookieParser from 'cookie-parser';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
// import 'dotenv/config';
import dotenv from 'dotenv';
import path from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: path.join(__dirname, '..', '.env') });

const app = express();
// app.use(
//   cors({
//     origin: ['http://localhost'],
//     allowedHeaders:
// ['Content-Type', 'Authorization', 'Access-Control-Allow-Methods', 'Access-Control-Request-Headers'],
//     credentials: true,
//     enablePreflight: true,
//   }),
// );

app.options('*', cors());
const corsOptions = {
  origin: '*',
  credentials: true, //access-control-allow-credentials:true
  optionSuccessStatus: 200,
};

app.use(cors(corsOptions)); 
app.all('', function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', "GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS");
  res.header('Access-Control-Allow-Headers', 'Origin,X-Requested-With,Content-Type,Accept,Authorization');
  //Auth Each API Request created by user.
  next();
});
app.use(cookieParser());

// app.use(
//   cors({
//     origin: [
//       'http://localhost',
//       'http://192.168.61.71',
//       'localhost',
//       '192.168.61.71',
//       `http://${process.env.CLIENT_HOST}:${process.env.PORT}`,
//       `http://${process.env.CLIENT_HOST}:${process.env.PORT}`,
//     ],
//   }),
// );
app.use(express.json({ limit: '50Mb' }));
app.use(express.urlencoded({ extended: false, limit: '50Mb' }));

const PORT = process.env.REACT_APP_SERVER_PORT || 3001;
const server = createServer(app);
const io = new Server(server, {
  // cors: process.env.ALLOWED_ORIGIN,
  cors: { origin: process.env.ALLOWED_ORIGIN },
  serveClient: true,
});

io.on('connection', (socket) => {
  onConnection(io, socket);
});

app.use('/api', routes);

server.listen(PORT, () => {
  console.log(`🚀 Server started on port ${PORT}`);
});
