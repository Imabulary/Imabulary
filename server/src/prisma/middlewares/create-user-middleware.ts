import { PrismaClient } from '@prisma/client';

export async function createWalletForUser(
  prisma: PrismaClient,
  userId: string,
) {
  await prisma.wallet.create({
    data: {
      userId,
      status: 'active',
      balance: 0,
    },
  });
}

export async function createUserMiddleware(params, next, prisma: PrismaClient) {
  if (params.model === 'Users' && params.action === 'create') {
    const result = await next(params);
    await createWalletForUser(prisma, result.id);
    return result;
  }
  return next(params);
}
