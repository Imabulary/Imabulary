-- AlterTable
ALTER TABLE "Cards" ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "quizStatusName" TEXT NOT NULL DEFAULT 'still_learning';

-- AlterTable
ALTER TABLE "FeedbackCategory" ALTER COLUMN "id" DROP DEFAULT;

-- CreateTable
CREATE TABLE "QuizCardStatus" (
    "id" VARCHAR NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "textRepresentation" TEXT NOT NULL,

    CONSTRAINT "QuizCardStatus_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Cards" ADD CONSTRAINT "Cards_quizStatusName_fkey" FOREIGN KEY ("quizStatusName") REFERENCES "QuizCardStatus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;