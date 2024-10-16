# Build and start containers for development
devBuild() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
  runMigration
  prismaGenerate
  prismaSeed
}

# Start containers for development
devStart() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
  runMigration
  prismaGenerate
  prismaSeed
}

# Shutdown containers that were run for development
devDown() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
}

# Shutdown containers and delete volumes that were run for development
devDownWithVolumes() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml down -v
}

# Build and start containers for production
prodBuild() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
}

# Start containers for production
prodStart() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
  prismaGenerate
}

# Shutdown containers that were run for production
prodDown() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml down
}

# Run migration inside backend docker container
runMigration() {
  MIGRATION_NAME=$1

  if [ -z $MIGRATION_NAME ]; then
    docker exec -it imabulary_backend sh -c "npx prisma migrate dev"

    return
  fi

  docker exec -it imabulary_backend sh -c "npx prisma migrate dev --name $MIGRATION_NAME"
}

# Generate TypeScript types based on prisma schema
prismaGenerate() {
  docker exec -it imabulary_backend sh -c "npx prisma generate"
}

# Seed an initial data inside database
prismaSeed() {
  docker exec -it imabulary_backend sh -c "npx prisma db seed"
}

# Build & Push to GCP
prodBuildPushGCR() {
  echo "Building Docker image for production..."
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml build backend

  echo "Tagging Docker image..."
  docker tag imabulary_backend:latest $GAR_LOCATION:${SHORT_SHA}

  echo "Pushing Docker image to Google Container Registry..."
  docker push $GAR_LOCATION:${SHORT_SHA}
}
