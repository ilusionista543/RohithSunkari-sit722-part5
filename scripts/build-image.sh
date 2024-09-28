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

docker tag book_catalog:latest $CONTAINER_REGISTRY.azurecr.io/book_catalog:latest
docker tag inventory_management:latest $CONTAINER_REGISTRY.azurecr.io/inventory_management:latest


