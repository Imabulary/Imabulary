/*
  Warnings:

  - The primary key for the `CardsOnSets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `CardsOnSets` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "CardsOnSets_setId_flashcardId_idx";

-- AlterTable
ALTER TABLE "CardsOnSets" DROP CONSTRAINT "CardsOnSets_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "CardsOnSets_pkey" PRIMARY KEY ("setId", "flashcardId");
