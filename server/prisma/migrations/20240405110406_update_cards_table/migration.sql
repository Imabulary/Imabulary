-- AlterTable
ALTER TABLE "Cards" ADD COLUMN     "usersId" VARCHAR;

-- AddForeignKey
ALTER TABLE "Cards" ADD CONSTRAINT "Cards_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
