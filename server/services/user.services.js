import { PrismaClient } from '@prisma/client';

class User {
  constructor() {
    this.prisma = new PrismaClient();
  }
  async post_user(data) {
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
      where: { name: { contains: data.name, mode: 'insensitive' } },
    });
    return users;
  }

  async get_user(data) {
    const user = await this.prisma.user.findUnique({
      where: { id: data.user_id },
    });
    return user;
  }

  async put_user(data) {
    const is_check = await this.prisma.user.count({ where: { id: data.user_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const user = await this.prisma.user.update({
      where: { id: data.user_id },
      data: { name: data.name, email: data.email },
    });
    return user;
  }

  async delete_user(data) {
    const is_check = await this.prisma.user.count({ where: { id: data.user_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const user = await this.prisma.user.delete({ where: { id: data.id } });
    return user;
  }
}

export default User;
