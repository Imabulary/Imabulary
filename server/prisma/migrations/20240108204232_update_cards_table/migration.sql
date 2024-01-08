/*
  Warnings:

  - The primary key for the `Cards` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "Cards" DROP CONSTRAINT "Cards_pkey",
ALTER COLUMN "id" SET DATA TYPE VARCHAR,
ALTER COLUMN "word" SET DATA TYPE VARCHAR,
ALTER COLUMN "translated_word" SET DATA TYPE VARCHAR,
ALTER COLUMN "target_language" SET DATA TYPE VARCHAR,
ALTER COLUMN "source_language" SET DATA TYPE VARCHAR,
ALTER COLUMN "image_url" SET DATA TYPE VARCHAR,
ADD CONSTRAINT "Cards_pkey" PRIMARY KEY ("id");
