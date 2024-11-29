/*
  Warnings:

  - You are about to drop the column `file_name` on the `Cards` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Cards" DROP COLUMN "file_name",
ADD COLUMN     "image_name" TEXT;
