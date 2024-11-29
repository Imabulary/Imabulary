/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `QuizCardStatus` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "QuizCardStatus_name_key" ON "QuizCardStatus"("name");
