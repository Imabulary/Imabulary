#!/bin/bash

# Define constants
CONTAINER_NAME="backend-container"
IMAGE_NAME="us-central1-docker.pkg.dev/imabulary/imabulary-prod/imabulary-prod:latest"

# Function: Run migration
runMigration() {
  MIGRATION_NAME=$1

  if [ -z "$MIGRATION_NAME" ]; then
    echo "Running default migration..."
    docker exec -it "${CONTAINER_NAME}" sh -c "npx prisma migrate deploy"
  else
    echo "Running migration with name: $MIGRATION_NAME"
    docker exec -it "${CONTAINER_NAME}" sh -c "npx prisma migrate deploy --name $MIGRATION_NAME"
  fi
}

# Function: Generate TypeScript types based on Prisma schema
prismaGenerate() {
  echo "Generating Prisma TypeScript types..."
  docker exec -it "${CONTAINER_NAME}" sh -c "npx prisma generate"
}

# Function: Seed initial data inside the database
prismaSeed() {
  echo "Seeding initial data into the database..."
  docker exec -it "${CONTAINER_NAME}" sh -c "npx prisma db seed"
}

# Step 1: Remove the container if it is already running
if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
  echo "Stopping and removing the existing container: ${CONTAINER_NAME}"
  docker stop "${CONTAINER_NAME}" && docker rm "${CONTAINER_NAME}"
else
  echo "No running container named ${CONTAINER_NAME} found."
fi

# Step 2: Remove the image locally if it exists
if docker images --format '{{.Repository}}:{{.Tag}}' | grep -Eq "^${IMAGE_NAME}$"; then
  echo "Removing existing image: ${IMAGE_NAME}"
  docker rmi "${IMAGE_NAME}"
else
  echo "No existing image named ${IMAGE_NAME} found."
fi

# Step 3: Authenticate and pull the latest image
echo "Authenticating with Google Artifact Registry..."
gcloud auth configure-docker us-central1-docker.pkg.dev

echo "Pulling the image: ${IMAGE_NAME}"
docker pull "${IMAGE_NAME}"

# Step 4: Run the container
echo "Running the container: ${CONTAINER_NAME}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p 5000:5000 \
  -e NODE_ENV=production \
  "${IMAGE_NAME}" \
  npm run start:prod

# Step 5: Run Prisma-related tasks
echo "Executing Prisma migration..."
runMigration

echo "Generating Prisma TypeScript types..."
prismaGenerate

echo "Seeding database..."
prismaSeed

echo "Script execution completed."