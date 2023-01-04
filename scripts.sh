# Build and start containers for development
devBuild() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
}

# Start containers for development
devStart() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
}

# Shutdown containers that was run for development
devDown() {
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
}

# Build and start containers for production
prodBuild() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
}

# Start containers for production
prodStart() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
}

# Shutdown containers that was run for production
prodDown() {
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml down
}
