#!/bin/bash

# Define constants
CONTAINER_NAME="backend-container"
IMAGE_NAME="us-central1-docker.pkg.dev/imabulary/imabulary-dev/imabulary-dev:latest"

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
gcloud auth configure-docker us-central1-docker.pkg.dev
# Step 3: Pull the image again
echo "Pulling the image: ${IMAGE_NAME}"
docker pull "${IMAGE_NAME}"

# Step 4: Run the container
echo "Running the container: ${CONTAINER_NAME}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p 5000:5000 \
  -e NODE_ENV=development \
  "${IMAGE_NAME}" \
  npm run start:dev

echo "Script execution completed."
