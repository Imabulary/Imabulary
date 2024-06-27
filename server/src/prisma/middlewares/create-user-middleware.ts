import { PrismaClient } from '@prisma/client';

export async function createUserMiddleware(params, next, prisma: PrismaClient) {
  if (params.model === 'Users' && params.action === 'create') {
    const result = await next(params);
    await createWalletForUser(prisma, result.id);
    return result;
  }
  return next(params);
}

export async function createWalletForUser(
  prisma: PrismaClient,
  userId: string,
) {
  const wallet = await prisma.wallet.create({ data: { userId } });

  await Promise.allSettled([
    createDailyAwardForWallet(prisma, wallet.id),
    createCashbackForWallet(prisma, wallet.id),
  ]);
}

export async function createDailyAwardForWallet(
  prisma: PrismaClient,
  walletId: string,
) {
  await prisma.awards.create({
    data: {
      walletId,
      lastAwardedAt: new Date().toISOString(),
    },
  });
}

export async function createCashbackForWallet(
  prisma: PrismaClient,
  walletId: string,
) {
  await prisma.cashback.create({ data: { walletId } });
}
