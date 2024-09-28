# 
# Delete the Kubernetes deployment

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl delete -f -