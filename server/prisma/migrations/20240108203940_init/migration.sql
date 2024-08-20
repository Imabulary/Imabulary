CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateTable
CREATE TABLE "Cards" (
    "id" TEXT NOT NULL,
    "word" TEXT NOT NULL,
    "phrase" TEXT NOT NULL,
    "translated_word" TEXT NOT NULL,
    "translated_phrase" TEXT NOT NULL,
    "target_language" TEXT NOT NULL,
    "source_language" TEXT NOT NULL,
    "image_url" TEXT NOT NULL,

    CONSTRAINT "Cards_pkey" PRIMARY KEY ("id")
);
