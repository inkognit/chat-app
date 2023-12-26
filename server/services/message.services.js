import { PrismaClient } from '@prisma/client';

class Message {
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
      where: { text: { contains: data.text, mode: 'insensitive' } },
    });
    return messages;
  }

  async get_message(data) {
    const message = await this.prisma.message.findUnique({
      where: { id: data.message_id },
    });
    return message;
  }

  async put_message(data) {
    const is_check = await this.prisma.message.count({ where: { id: data.message_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const message = await this.prisma.message.update({
      where: { id: data.message_id },
      data: { text: data.text },
    });
    return message;
  }

  async delete_message(data) {
    const is_check = await this.prisma.message.count({ where: { id: data.message_id } });
    if (!is_check) throw { message: 'По данному идентификатору ничего не найдено' };
    const message = await this.prisma.message.delete({ where: { id: data.id } });
    return message;
  }
}

export default Message;
