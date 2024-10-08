# Publishes both the Docker images.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.

set -u # or set -o nounset
: "$CONTAINER_REGISTRY"

docker push $CONTAINER_REGISTRY.azurecr.io/book-catalog:latest
docker push $CONTAINER_REGISTRY.azurecr.io/inventory-management:latest
