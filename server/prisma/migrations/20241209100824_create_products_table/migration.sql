-- CreateTable
CREATE TABLE "Products" (
    "id" VARCHAR NOT NULL,
    "externalId" TEXT NOT NULL,
    "benefits" JSONB NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Products_externalId_key" ON "Products"("externalId");
