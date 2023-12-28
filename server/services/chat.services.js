import { PrismaClient } from '@prisma/client';

class ChatService {
  constructor() {
    this.prisma = new PrismaClient();
  }

  async post_chat(data) {
    const user_ids = data.users.map((item) => ({ user_id: item.user_id }));
    const chat = await this.prisma.chat.create({
      data: {
        title: data.title || '',
        user_chat: { createMany: { skipDuplicates: true, data: user_ids } },
        creator_id: user_ids[0],
      },
    });

    return chat;
  }

  async get_chats(data) {
    const chats = await this.prisma.user_chat.findMany({
      where: {
        user_id: +data.user_id,
        chat: { title: { contains: data.title, mode: 'insensitive' } },
      },
      select: {
        chat: {
          select: {
            id: true,
            title: true,
          },
        },
      },
    });
    return chats.map((i) => i.chat);
  }

  async get_chat(chat_id, user_id) {
    const chat = await this.prisma.chat.findFirst({
      where: { user_chat: { some: { chat_id, user_id } } },
    });
    return chat;
  }

  async put_chat(data) {
    const users = await this.prisma.user_chat.findMany({
      where: { chat_id: data.id },
      select: { user_id: true },
    });
    if (users.length < 2) throw { message: 'По данному идентификатору ничего не найдено' };
    const create_many = data.users.filter((user) => !(users.findIndex((u) => u.user_id === user.user_id) > -1));
    const delete_many = users.filter((user) => !(data.users.findIndex((du) => du.user_id === user.user_id) > -1));
    const chat = await this.prisma.chat.update({
      where: { id: data.id, user_chat: { some: { chat_id: data.id, user_id: data.user_id } } },
      data: { title: data.title, user_chat: { createMany: { data: create_many }, deleteMany: delete_many } },
    });
    return chat;
  }

  async delete_chat(id, user_id) {
    const is_check = await this.prisma.chat.count({
      where: {
        id,
        creator_id: user_id,
      },
    });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const chat = await this.prisma.$transaction(
    [
       this.prisma.user_chat.deleteMany({ where: { chat: { id } } }),
       this.prisma.chat.delete({ where: { id } }),
    ]);

    return chat;
  }
}

export default ChatService;
