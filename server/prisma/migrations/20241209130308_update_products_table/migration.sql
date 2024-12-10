/*
  Warnings:

  - Made the column `internalId` on table `Products` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Products" ALTER COLUMN "internalId" SET NOT NULL;
