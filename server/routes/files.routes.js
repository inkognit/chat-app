import { Router } from 'express';
import { upload_processed, files_processed } from '../controllers/files.controller.js';
import upload from '../utils/upload.js';
const files_routes = Router();

files_routes.use('/upload', upload.single('file'), upload_processed);

files_routes.use('/files', files_processed);

export default files_routes;

