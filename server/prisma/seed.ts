import { PrismaClient } from '@prisma/client';

const username = process.env.POSTGRES_USER;
const password = process.env.POSTGRES_PASSWORD;
const database = process.env.POSTGRES_DB;

const prisma = new PrismaClient({
  datasourceUrl: `postgresql://${username}:${password}@localhost:5433/${database}`,
});

async function main() {
  const feedbackCategories = [
    {
      name: 'Word not as in the photo',
      meaning:
        'This means that the system does not recognize the element in the photo correctly.',
    },
    {
      name: 'The object I wanted is not in this list',
      meaning:
        'This means that the system returned some objects on provided by the user image, but there was object they wanted',
    },
    {
      name: 'Wrong translation of the word in the photo',
      meaning: 'This means that the system pulled up an incorrect translation.',
    },
    {
      name: 'Sound does not play',
      meaning: 'This means the sound playback function does not work.',
    },
    {
      name: 'Incorrect word definition',
      meaning: 'This means that the system pulled up an incorrect definition.',
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
  ];

  const statuses = ['still_learning', 'not_studied', 'mastered'];

  await Promise.all(
    feedbackCategories.map((category) => {
      const categoryWithSlug = {
        ...category,
        slug: category.name.replaceAll(' ', '-').toLowerCase(),
      };

      return prisma.feedbackCategory.upsert({
        where: { slug: categoryWithSlug.slug },
        create: categoryWithSlug,
        update: categoryWithSlug,
      });
    }),
  );

  await Promise.all(
    statuses.map((status) => {
      return prisma.quizCardStatus.upsert({
        where: { name: status },
        create: { name: status },
        update: { name: status },
      });
    }),
  );
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
