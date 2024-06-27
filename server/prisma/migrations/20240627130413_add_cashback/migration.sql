-- CreateTable
CREATE TABLE "Cashback" (
    "id" VARCHAR NOT NULL,
    "walletId" VARCHAR NOT NULL,
    "level" INTEGER NOT NULL DEFAULT 1,
    "refund" DOUBLE PRECISION NOT NULL DEFAULT 0.1,

    CONSTRAINT "Cashback_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cashback_walletId_key" ON "Cashback"("walletId");

-- AddForeignKey
ALTER TABLE "Cashback" ADD CONSTRAINT "Cashback_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
