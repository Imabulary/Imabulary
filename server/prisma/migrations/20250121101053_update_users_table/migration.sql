/*
  Warnings:

  - A unique constraint covering the columns `[productId]` on the table `Users` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "productId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Users_productId_key" ON "Users"("productId");

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("id") ON DELETE SET NULL ON UPDATE CASCADE;
