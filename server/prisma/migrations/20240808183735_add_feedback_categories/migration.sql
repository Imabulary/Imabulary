-- AlterTable
ALTER TABLE "Feedback" ADD COLUMN     "categoryId" TEXT;

-- CreateTable
CREATE TABLE "FeedbackCategory" (
    "id" VARCHAR NOT NULL,
    "name" TEXT NOT NULL,
    "meaning" TEXT NOT NULL,

    CONSTRAINT "FeedbackCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "FeedbackCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- -- Insert values into FeedbackCategory
-- INSERT INTO "FeedbackCategory" ("name", "meaning")
-- VALUES
-- ('discrepancy_image_word', 'This means that the system does not recognize the element in the photo correctly. If I select only this option, the flash card generation will start from the very beginning.'),
-- ('translation_error_photo', 'This means that the system pulled up an incorrect translation. If I select only this option, the flash card generation will start from the beginning.'),
-- ('sound_playback_issue', 'This means the sound playback function does not work. If I select only this option, the flash card generation will start from the beginning.'),
-- ('definition_error', 'This means that the system pulled up an incorrect definition. For example, it mixed up homonyms. If I select only this option, the flash card generation will start from the beginning.'),
-- ('example_usage_issue', 'This means that the system pulled up an incorrect example. It sounds unnaturally. If I select only this option, the data (word, definition, pronunciation) remains, only the example usage will change.'),
-- ('other_optional', 'If I check the box, an additional field will appear.');
