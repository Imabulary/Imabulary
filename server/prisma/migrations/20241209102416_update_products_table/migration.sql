/*
  Warnings:

  - A unique constraint covering the columns `[internalId]` on the table `Products` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Products" ADD COLUMN     "internalId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Products_internalId_key" ON "Products"("internalId");
