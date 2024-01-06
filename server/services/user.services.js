import { PrismaClient } from '@prisma/client';

class UserService {
  constructor() {
    this.prisma = new PrismaClient();
  }
  async post_user(data) {
    const is_check = await this.prisma.user.count({ where: { email: data.email } });
    if (is_check) throw { message: 'Такой email уже используется' };
    const user = await this.prisma.user.create({
      data: {
        name: data.name,
        email: data.email,
      },
    });
    return user;
  }

  async get_users(data) {
    const users = await this.prisma.user.findMany({
      where: {
        name: { contains: data.name, mode: 'insensitive' },
        email: { contains: data.email, mode: 'insensitive' },
      },
    });
    return users;
  }

  async get_user(id) {
    const user = await this.prisma.user.findUnique({
      where: { id },
    });
    return user;
  }

  async put_user(data) {
    const is_check = await this.prisma.user.count({ where: { id: data.id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    if (data.email) {
      const is_check_email = await this.prisma.user.count({ where: { email: data.email } });
      if (is_check_email) throw { message: 'Данный email уже используется' };
    }
    const user = await this.prisma.user.update({
      where: { id: data.id },
      data: {
        name: data.name,
        email: data.email,
      },
    });
    return user;
  }

  async delete_user(id) {
    const is_check = await this.prisma.user.count({ where: { id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const user = await this.prisma.user.delete({ where: { id } });
    return user;
  }
}

export default UserService;
