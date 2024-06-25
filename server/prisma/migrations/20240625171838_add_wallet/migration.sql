-- CreateTable
CREATE TABLE "Wallet" (
    "id" VARCHAR NOT NULL,
    "userId" VARCHAR NOT NULL,
    "status" TEXT,
    "balance" DOUBLE PRECISION,

    CONSTRAINT "Wallet_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Wallet_userId_key" ON "Wallet"("userId");

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
