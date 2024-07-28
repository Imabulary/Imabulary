import { PrismaClient } from '@prisma/client';

// Prisma extension: https://www.prisma.io/docs/orm/prisma-client/client-extensions#extended-clients
export const extendedPrismaClient = new PrismaClient().$extends({
  query: {
    users: {
      create: async ({ query, args }) => {
        const user = await query(args);

        const wallet = await extendedPrismaClient.wallet.create({
          data: { userId: user.id },
        });

        await Promise.allSettled([
          extendedPrismaClient.awards.create({
            data: { walletId: wallet.id },
          }),
          extendedPrismaClient.cashback.create({
            data: { walletId: wallet.id },
          }),
        ]);

        return user;
      },
    },
  },
});

export type ExtendedPrismaClient = typeof extendedPrismaClient;
