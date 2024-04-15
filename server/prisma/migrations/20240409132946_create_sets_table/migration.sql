-- CreateTable
CREATE TABLE "Sets" (
    "id" VARCHAR NOT NULL,
    "name" VARCHAR NOT NULL,
    "description" TEXT,
    "userId" VARCHAR,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Sets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardsOnSets" (
    "setId" TEXT NOT NULL,
    "flashcardId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CardsOnSets_pkey" PRIMARY KEY ("setId","flashcardId")
);

-- CreateTable
CREATE TABLE "_CardsToSets" (
    "A" VARCHAR NOT NULL,
    "B" VARCHAR NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CardsToSets_AB_unique" ON "_CardsToSets"("A", "B");

-- CreateIndex
CREATE INDEX "_CardsToSets_B_index" ON "_CardsToSets"("B");

-- AddForeignKey
ALTER TABLE "Sets" ADD CONSTRAINT "Sets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardsOnSets" ADD CONSTRAINT "CardsOnSets_setId_fkey" FOREIGN KEY ("setId") REFERENCES "Sets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardsOnSets" ADD CONSTRAINT "CardsOnSets_flashcardId_fkey" FOREIGN KEY ("flashcardId") REFERENCES "Cards"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardsToSets" ADD CONSTRAINT "_CardsToSets_A_fkey" FOREIGN KEY ("A") REFERENCES "Cards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CardsToSets" ADD CONSTRAINT "_CardsToSets_B_fkey" FOREIGN KEY ("B") REFERENCES "Sets"("id") ON DELETE CASCADE ON UPDATE CASCADE;
