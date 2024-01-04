import cors from 'cors';
import express, { json } from 'express';
import { createServer } from 'http';
import { Server } from 'socket.io';
import onConnection from './services/socket_io.js';
import routes from './routes/routes.js';

const app = express();
app.use(
  cors({
    origin: [process.env.ALLOWED_ORIGIN],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
  }),
);

const PORT = process.env.SERVER_PORT || 3001;
const server = createServer(app);
const io = new Server(server, {
  cors: process.env.ALLOWED_ORIGIN,
  serveClient: false,
});

io.on('connection', (socket) => {
  onConnection(io, socket);
});

app.use(json());

app.use('/api', routes);

server.listen(PORT, () => {
  console.log(`🚀 Server started on port ${PORT}`);
});
