-- DropForeignKey
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_walletId_fkey";

-- DropForeignKey
ALTER TABLE "CardsOnSets" DROP CONSTRAINT "CardsOnSets_flashcardId_fkey";

-- DropForeignKey
ALTER TABLE "CardsOnSets" DROP CONSTRAINT "CardsOnSets_setId_fkey";

-- DropForeignKey
ALTER TABLE "Cashback" DROP CONSTRAINT "Cashback_walletId_fkey";

-- DropForeignKey
ALTER TABLE "Sets" DROP CONSTRAINT "Sets_userId_fkey";

-- DropForeignKey
ALTER TABLE "Wallet" DROP CONSTRAINT "Wallet_userId_fkey";

-- AddForeignKey
ALTER TABLE "Sets" ADD CONSTRAINT "Sets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardsOnSets" ADD CONSTRAINT "CardsOnSets_setId_fkey" FOREIGN KEY ("setId") REFERENCES "Sets"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardsOnSets" ADD CONSTRAINT "CardsOnSets_flashcardId_fkey" FOREIGN KEY ("flashcardId") REFERENCES "Cards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Awards" ADD CONSTRAINT "Awards_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cashback" ADD CONSTRAINT "Cashback_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;
