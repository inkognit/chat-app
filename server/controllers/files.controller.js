export function upload_processed(req, res) {
  if (!req.file) return res.sendStatus(400);

  // формируем относительный путь к файлу
  const relativeFilePath = req.file.path.replace(/\\/g, '/').split('server/files')[1];
  // и возвращаем его
  res.status(201).json(relativeFilePath);
}


export function files_processed(req, res) {
  // формируем абсолютный путь к файлу
  const filePath = getFilePath(req.url)
  // и возвращаем файл по этому пути
  res.status(200).sendFile(filePath)
}