import { PrismaClient } from '@prisma/client';

class Chat {
  constructor() {
    this.prisma = new PrismaClient();
  }

  async post_chat(data) {
    const user_ids = data.users.map((item) => ({ user_id: item.user_id }));
    const chat = await this.prisma.chat.create({
      data: { title: data.title || '', user_chat: { createMany: { skipDuplicates: true, data: user_ids } } },
    });

    return chat;
  }

  async get_chats(data) {
    const chats = await this.prisma.chat.findMany({
      where: { title: { contains: data.title, mode: 'insensitive' } },
    });
    return chats;
  }

  async get_chat(data) {
    const chat = await this.prisma.chat.findUnique({
      where: { id: data.chat_id },
    });
    return chat;
  }

  async put_chat(data) {
    const is_check = await this.prisma.chat.count({ where: { id: data.chat_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const chat = await this.prisma.chat.update({
      where: { id: data.chat_id },
      data: { title: data.title },
    });
    return chat;
  }

  async delete_chat(data) {
    const is_check = await this.prisma.chat.count({ where: { id: data.chat_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const chat = await this.prisma.chat.delete({ where: { id: data.id } });
    return chat;
  }
}

export default Chat;
