-- CreateTable
CREATE TABLE "Feedback" (
    "id" VARCHAR NOT NULL,
    "cardId" VARCHAR NOT NULL,
    "isAppropriate" BOOLEAN,
    "textFeedback" TEXT,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Feedback_cardId_key" ON "Feedback"("cardId");

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Cards"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
