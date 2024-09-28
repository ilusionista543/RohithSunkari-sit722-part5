#
# Builds a Docker image and tags it.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#

# Step 1: Build the Docker image
docker-compose up --build -d

echo "Docker images built successfully."

docker tag book-catalog:latest $CONTAINER_REGISTRY.azurecr.io/book-catalog:latest
docker tag inventory-management:latest $CONTAINER_REGISTRY.azurecr.io/inventory-management:latest


