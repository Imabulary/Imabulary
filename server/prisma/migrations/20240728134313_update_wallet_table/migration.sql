/*
  Warnings:

  - The `status` column on the `Wallet` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "WalletStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- AlterTable
ALTER TABLE "Wallet" DROP COLUMN "status",
ADD COLUMN     "status" "WalletStatus" NOT NULL DEFAULT 'ACTIVE';
