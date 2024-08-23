DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'Cards'
        AND column_name = 'deletedAt'
    ) THEN
        ALTER TABLE "Cards" ADD COLUMN "deletedAt" TIMESTAMP(3);
    END IF;
END $$;
