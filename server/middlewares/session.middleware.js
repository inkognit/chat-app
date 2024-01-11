import jwt from 'jsonwebtoken';

export const session = (req, res, next) => {
  const access_token = req.headers['authorization'];
  let refresh_token;
  if (!req.cookies) {
    const index = req.rawHeaders.findIndex((item) => item === 'cookie');
    if (index < 0) {
      return res.status(401).send('Access Denied. No token provided.');
    }
    refresh_token = req.rawHeaders[index + 1].substring(14);
  } else {
    refresh_token = req.cookies['refresh_token'];
  }
  const secret = Buffer.from(process.env.JWT_SECRET);
  if ((!access_token || !access_token.startsWith('Bearer ')) && !refresh_token) {
    return res.status(401).send('Access Denied. No token provided.');
  }

  try {
    const { user } = jwt.verify(access_token.substring(7), secret);
    req.session = user;
    next();
  } catch (error) {
    if (!refresh_token) {
      return res.status(401).send('Access Denied. No refresh token provided.');
    }

    try {
      const { user } = jwt.verify(refresh_token, secret);
      const access_token = `Bearer ${jwt.sign({ user }, secret, { expiresIn: '1d' })}`;

      res
        .cookie('refresh_token', refresh_token, { httpOnly: true, sameSite: 'strict' })
        .header('authorization', access_token);
      req.session = user;
      next();
    } catch (error) {
      return res.status(400).send('Invalid Token.');
    }
  }
};
