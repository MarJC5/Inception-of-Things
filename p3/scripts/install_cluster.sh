#!/bin/bash

# Only run in sudo mode
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

# Create k3d cluster and setup namespace
sudo k3d cluster create inception --servers 1 --agents 1
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# Install Argo-CD on namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# Wait for pods to be running : kubectl get pods -n argocd -w
echo "Waiting for Argo-CD pods to be running..."
sleep 60
# Apply the argocd configuration
# Remember to change it according to your needs
sudo kubectl apply -n argocd -f ./confs/argo-app.yaml
# Once running, get the argocd password
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# Copy the password, you will need to use it to log in as admin
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443

# Test the access :
# Start a port-forwarding on the dev namespace
# sudo kubectl port-forward svc/playground-service -n dev 8888:80
# curl on localhost
# curl http://localhost:8888
# Should show : {"status":"ok", "message": "v1"}