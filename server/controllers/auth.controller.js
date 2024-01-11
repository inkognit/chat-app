import { sign_up, sign_in } from '../services/auth.service.js';
import DeviceDetector from 'node-device-detector';
import ipware from 'ipware';

export const sign_in_controller = async (req, res) => {
  try {
    const detector = new DeviceDetector({
      clientIndexes: true,
      deviceIndexes: true,
      deviceAliasCode: false,
    });

    const { body } = req;
    const device_info = detector.detect(req.headers['user-agent']);
    const device_info_string = JSON.stringify({
      device_code: device_info.device.code,
      device_model: device_info.device.model,
      device_type: device_info.device.type,
      client_type: device_info.client.type,
      client_name: device_info.client.name,
    });
    const { clientIp } = ipware().get_ip(req);
    const data = await sign_in(body, device_info_string, clientIp);
    return res
      .cookie('refresh_token', data.refresh_token, { httpOnly: true, sameSite: 'strict' })
      .header('authorization', data.access_token)
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
