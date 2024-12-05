/*
  Warnings:

  - You are about to drop the `Awards` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cashback` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Awards" DROP CONSTRAINT "Awards_walletId_fkey";

-- DropForeignKey
ALTER TABLE "Cashback" DROP CONSTRAINT "Cashback_walletId_fkey";

-- DropTable
DROP TABLE "Awards";

-- DropTable
DROP TABLE "Cashback";
