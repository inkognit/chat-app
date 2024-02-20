import cors from 'cors';
import express, { json } from 'express';
import { createServer } from 'http';
import { Server } from 'socket.io';
import onConnection from './services/socket_io.js';
import routes from './routes/routes.js';
import cookieParser from 'cookie-parser';
import 'dotenv/config';

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

// app.options('*', cors());

// app.all('', function (req, res, next) {
//   res.header('Access-Control-Allow-Origin', 'http://localhost');
//   res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
//   res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
//   //Auth Each API Request created by user.
//   next();
// });
app.use(cookieParser());
app.use(cors());
app.use(express.json({ limit: '50Mb' }));
app.use(express.urlencoded({ extended: false, limit: '50Mb' }));

const PORT = process.env.SERVER_PORT || 3001;
const server = createServer(app);
const io = new Server(server, {
  // cors: process.env.ALLOWED_ORIGIN,
  cors: { origin: process.env.ALLOWED_ORIGIN },
  serveClient: true,
});

io.on('connection', (socket) => {
  onConnection(io, socket);
});

app.use(json());

app.use('/api', routes);

server.listen(PORT, () => {
  console.log(`🚀 Server started on port ${PORT}`);
});
