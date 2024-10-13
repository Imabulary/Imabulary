-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_cardId_fkey";

-- AlterTable
ALTER TABLE "Feedback" ADD COLUMN     "metadata" JSONB,
ALTER COLUMN "cardId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Cards"("id") ON DELETE SET NULL ON UPDATE CASCADE;
