/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `Feedback` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `FeedbackCategory` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Feedback` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Feedback" ADD COLUMN     "userId" VARCHAR NOT NULL;

-- AlterTable
ALTER TABLE "FeedbackCategory" ADD COLUMN     "slug" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Feedback_userId_key" ON "Feedback"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "FeedbackCategory_slug_key" ON "FeedbackCategory"("slug");

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
