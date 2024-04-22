/*
  Warnings:

  - The primary key for the `CardsOnSets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `id` was added to the `CardsOnSets` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "CardsOnSets" DROP CONSTRAINT "CardsOnSets_pkey",
ADD COLUMN     "id" VARCHAR NOT NULL,
ADD CONSTRAINT "CardsOnSets_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE INDEX "CardsOnSets_setId_flashcardId_idx" ON "CardsOnSets"("setId", "flashcardId");
