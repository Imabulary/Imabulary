import { PrismaClient } from '@prisma/client';

const databaseUrl = process.env.DATABASE_URL;

const prisma = new PrismaClient({
  datasourceUrl: databaseUrl,
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
  ];

  const statuses = ['still_learning', 'not_studied', 'mastered'];

  const products = [
    {
      name: 'Imabulary Free',
      description: 'Best for the beginners',
      internalId: 'imabulary_free',
      benefits: {
        coins: 5,
        sets: 3,
        flashcardsInSet: 20,
        ads: true,
        coinsFrequency: 'daily',
      },
    },
    {
      name: 'Imabulary NEXT',
      description: 'Best for the quick progress',
      internalId: 'imabulary_next_monthly',
      externalId: 'imabulary_next_monthly',
      benefits: {
        coins: 500,
        sets: 50,
        flashcardsInSet: null,
        ads: false,
        coinsFrequency: 'monthly',
      },
    },
  ];

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

  await Promise.all(
    products.map((product) =>
      prisma.products.upsert({
        where: { internalId: product.internalId },
        create: product,
        update: product,
      }),
    ),
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
