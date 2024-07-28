/*
  Warnings:

  - The `lastAwardedAt` column on the `Awards` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Awards" DROP COLUMN "lastAwardedAt",
ADD COLUMN     "lastAwardedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
