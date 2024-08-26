import { PrismaClient } from '@prisma/client';

const username = process.env.POSTGRES_USER;
const password = process.env.POSTGRES_PASSWORD;
const database = process.env.POSTGRES_DB;

const prisma = new PrismaClient({
  datasourceUrl: `postgresql://${username}:${password}@localhost:5433/${database}`,
});

async function main() {
  await Promise.all([
    await prisma.quizCardStatus.createMany({
      data: [
        { name: 'still_learning' },
        { name: 'not_studied' },
        { name: 'mastered' },
      ],
    }),
    await prisma.feedbackCategory.createMany({
      data: [
        {
          name: 'Word not as in the photo',
          meaning:
            'This means that the system does not recognize the element in the photo correctly.',
        },
        {
          name: 'Wrong translation of the word in the photo',
          meaning:
            'This means that the system pulled up an incorrect translation.',
        },
        {
          name: 'Sound does not play',
          meaning: 'This means the sound playback function does not work.',
        },
        {
          name: 'Incorrect word definition',
          meaning:
            'This means that the system pulled up an incorrect definition.',
        },
        {
          name: 'Incorrect example of word usage',
          meaning:
            'This means that the system pulled up an incorrect example. It sounds unnaturally.',
        },
        {
          name: 'Other',
          meaning:
            'Something else is wrong with the flashcard, I will tell you what in the text field down below.',
        },
      ],
    }),
  ]);
}

main()
  .catch((e) => {
    // eslint-disable-next-line no-console
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
