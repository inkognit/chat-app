import { sign_up, sign_in } from '../services/auth.service.js';
import ipware from 'ipware';
import { device_info } from '../utils/get_device_info.util.js';

export const sign_in_controller = async (req, res) => {
  try {
    const { body } = req;

    const { clientIp } = ipware().get_ip(req);
    const data = await sign_in(body, device_info(req.headers['user-agent']), clientIp);
    return res
      .cookie('access_token', data.access_token, { httpOnly: true, sameSite: 'strict', secure: true })
      .send({ data });
  } catch (error) {
    res.send({ message: error.message || error });
  }
};

export const sign_up_controller = async (req, res) => {
  try {
    const { body } = req;
    const data = await sign_up(body);
    return res.send({ data });
  } catch (error) {
    res.send({ message: error.message || error });
  }
};

export const refresh_token_controller = async (req, res) => {
  try {
    const { body } = req;
    const data = await sign_up(body);
    return res.send({ data });
  } catch (error) {
    res.send({ message: error.message || error });
  }
};

export const sign_out_controller = async (req, res) => {
  try {
    const { body } = req;
    const data = await sign_up(body);
    return res.send({ data });
  } catch (error) {
    res.send({ message: error.message || error });
  }
};
