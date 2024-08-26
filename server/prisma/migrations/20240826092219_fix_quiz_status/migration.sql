/*
  Warnings:

  - You are about to drop the column `quizStatusName` on the `Cards` table. All the data in the column will be lost.
  - You are about to drop the column `textRepresentation` on the `QuizCardStatus` table. All the data in the column will be lost.
  - Added the required column `quizStatusId` to the `Cards` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Cards" DROP CONSTRAINT "Cards_quizStatusName_fkey";

-- AlterTable
ALTER TABLE "Cards" DROP COLUMN "quizStatusName",
ADD COLUMN     "is_regenerated" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "quizStatusId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "QuizCardStatus" DROP COLUMN "textRepresentation";

-- AddForeignKey
ALTER TABLE "Cards" ADD CONSTRAINT "Cards_quizStatusId_fkey" FOREIGN KEY ("quizStatusId") REFERENCES "QuizCardStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
