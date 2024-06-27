-- CreateTable
CREATE TABLE "Awards" (
    "id" VARCHAR NOT NULL,
    "walletId" VARCHAR NOT NULL,
    "lastAwardedAt" TEXT,
    "streekLevel" INTEGER NOT NULL DEFAULT 1,
    "streekCount" INTEGER NOT NULL DEFAULT 0,
    "award" DOUBLE PRECISION NOT NULL DEFAULT 1.0,

    CONSTRAINT "Awards_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Awards_walletId_key" ON "Awards"("walletId");

-- AddForeignKey
ALTER TABLE "Awards" ADD CONSTRAINT "Awards_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
