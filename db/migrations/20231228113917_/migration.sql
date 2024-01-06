/*
  Warnings:

  - Made the column `chat_id` on table `message` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "message" DROP CONSTRAINT "message_chat_id_fkey";

-- AlterTable
ALTER TABLE "chat" ADD COLUMN     "creator_id" INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "message" ALTER COLUMN "chat_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "message" ADD CONSTRAINT "message_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
