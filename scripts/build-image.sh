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

# Step 2: Tag the Docker image with an additional tag (e.g., latest)

docker tag book-catalog:$VERSION $CONTAINER_REGISTRY/book-catalog:$VERSION
docker tag inventory-management:$VERSION $CONTAINER_REGISTRY/inventory-management:$VERSION