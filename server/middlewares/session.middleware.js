import { PrismaClient } from '@prisma/client';
import jwt from 'jsonwebtoken';
import { device_info } from '../utils/get_device_info.util.js';

export const session = async (req, res, next) => {
  const prisma = new PrismaClient();
  // let refresh_token;
  let access_token = req.headers['authorization'];


  const secret = Buffer.from(process.env.JWT_SECRET);
  if (!access_token || !access_token.startsWith('Bearer ')) {
    return res.status(401).send('Access Denied. No token provided.');
  }

  try {
    const { user } = jwt.verify(access_token.substring(7), secret);
    req.session = user;
    next();
  } catch (error) {
    // if (!refresh_token) {
    //   return res.status(401).send('Access Denied. No refresh token provided.');
    // }

    if (error.name !== 'TokenExpiredError') {
      return res.status(400).send('Invalid Token.');
    }
    try {
      let { user } = jwt.decode(access_token.substring(7), secret);

      const { refresh_token } = await prisma.session.findFirst({
        where: { user_id: user.id, device_info: device_info(req.headers['user-agent']), is_used: false },
      });

      jwt.verify(refresh_token, secret);
      access_token = `Bearer ${jwt.sign({ user }, secret, { expiresIn: '15m' })}`;
      req.session = user;

      res.cookie('access_token', access_token, { httpOnly: true, secure: true, sameSite: 'strict' })
      .header('authorization', access_token);
      return next();
    } catch (error) {
      return res.status(400).send('Invalid Token.');
    }
  }
};
