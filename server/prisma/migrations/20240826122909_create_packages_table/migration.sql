-- CreateTable
CREATE TABLE "Packages" (
    "id" VARCHAR NOT NULL,
    "externalId" TEXT NOT NULL,
    "name" VARCHAR NOT NULL,
    "coinsAmount" INTEGER NOT NULL,

    CONSTRAINT "Packages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Packages_externalId_key" ON "Packages"("externalId");
