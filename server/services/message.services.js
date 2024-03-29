import { PrismaClient } from '@prisma/client';

class MessageService {
  constructor() {
    this.prisma = new PrismaClient();
  }
  async post_message(data) {
    const message = await this.prisma.message.create({
      data: {
        text: data.text,
        type: data.type || 'text',
        author_id: data.user_id,
        chat_id: data.chat_id,
      },
    });
    return message;
  }

  async get_messages(data) {
    const messages = await this.prisma.message.findMany({
      where: {
        text: {
          contains: data.text,
          mode: 'insensitive',
        },
        chat_id: +data.chat_id,
      },
      include: { author: { select: { name: true } } },
    });
    return messages.map(({ author, ...m }) => ({ ...m, author_name: author.name }));
  }

  async get_message(id) {
    const message = await this.prisma.message.findUnique({
      where: { id },
    });
    return message;
  }

  async put_message(data) {
    const is_check = await this.prisma.message.count({ where: { id: data.id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const message = await this.prisma.message.update({
      where: { id: data.id },
      data: { text: data.text },
    });
    return message;
  }

  async delete_message(ids) {
    const message = await this.prisma.message.deleteMany({ where: { id: { in: ids } } });
    return message;
  }
}

export default MessageService;
