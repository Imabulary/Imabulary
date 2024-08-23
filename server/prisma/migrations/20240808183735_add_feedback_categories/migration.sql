-- AlterTable
ALTER TABLE "Feedback" ADD COLUMN     "categoryId" TEXT;

-- CreateTable
CREATE TABLE "FeedbackCategory" (
    "id" VARCHAR NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "meaning" TEXT NOT NULL,

    CONSTRAINT "FeedbackCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "FeedbackCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;
