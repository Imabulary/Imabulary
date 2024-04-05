/*
  Warnings:

  - You are about to drop the column `usersId` on the `Cards` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Cards" DROP CONSTRAINT "Cards_usersId_fkey";

-- AlterTable
ALTER TABLE "Cards" DROP COLUMN "usersId",
ADD COLUMN     "userId" VARCHAR;

-- AddForeignKey
ALTER TABLE "Cards" ADD CONSTRAINT "Cards_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
