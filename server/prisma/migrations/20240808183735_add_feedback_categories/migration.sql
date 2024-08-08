-- AlterTable
ALTER TABLE "Feedback" ADD COLUMN     "feedbackCategoryId" TEXT;

-- CreateTable
CREATE TABLE "FeedbackCategory" (
    "id" VARCHAR NOT NULL,
    "name" TEXT NOT NULL,
    "meaning" TEXT NOT NULL,
    "language_representation_UA" TEXT NOT NULL,
    "language_representation_UK" TEXT NOT NULL,

    CONSTRAINT "FeedbackCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_feedbackCategoryId_fkey" FOREIGN KEY ("feedbackCategoryId") REFERENCES "FeedbackCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- Insert values into FeedbackCategory
INSERT INTO "FeedbackCategory" ("name", "meaning", "language_representation_UA", "language_representation_UK")
VALUES
('discrepancy_image_word', 'This means that the system does not recognize the element in the photo correctly. If I select only this option, the flash card generation will start from the very beginning.', 'Слово не те, що на фото', 'Word does not match the photo'),
('translation_error_photo', 'This means that the system pulled up an incorrect translation. If I select only this option, the flash card generation will start from the beginning.', 'Переклад слова на фото', 'Translation of the word on the photo'),
('sound_playback_issue', 'This means the sound playback function does not work. If I select only this option, the flash card generation will start from the beginning.', 'Не відтворюється звук', 'Sound does not play'),
('definition_error', 'This means that the system pulled up an incorrect definition. For example, it mixed up homonyms. If I select only this option, the flash card generation will start from the beginning.', 'Визначення слова', 'Definition error'),
('example_usage_issue', 'This means that the system pulled up an incorrect example. It sounds unnaturally. If I select only this option, the data (word, definition, pronunciation) remains, only the example usage will change.', 'Приклад вживання слова', 'Example usage issue'),
('other_optional', 'If I check the box, an additional field will appear.', 'Інше (опціонально)', 'Other (optional)');
