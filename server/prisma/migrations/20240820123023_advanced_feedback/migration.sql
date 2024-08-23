/*
  Warnings:

  - You are about to drop the column `categoryId` on the `Feedback` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_categoryId_fkey";

-- AlterTable
ALTER TABLE "Cards" ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "is_regenerated" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Feedback" DROP COLUMN "categoryId";

-- AlterTable
ALTER TABLE "FeedbackCategory" ALTER COLUMN "id" DROP DEFAULT;

-- CreateTable
CREATE TABLE "_card_feedbacks_categories" (
    "A" VARCHAR NOT NULL,
    "B" VARCHAR NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_card_feedbacks_categories_AB_unique" ON "_card_feedbacks_categories"("A", "B");

-- CreateIndex
CREATE INDEX "_card_feedbacks_categories_B_index" ON "_card_feedbacks_categories"("B");

-- AddForeignKey
ALTER TABLE "_card_feedbacks_categories" ADD CONSTRAINT "_card_feedbacks_categories_A_fkey" FOREIGN KEY ("A") REFERENCES "Feedback"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_card_feedbacks_categories" ADD CONSTRAINT "_card_feedbacks_categories_B_fkey" FOREIGN KEY ("B") REFERENCES "FeedbackCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
