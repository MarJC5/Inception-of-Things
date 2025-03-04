#!/bin/bash
# Create k3d cluster and setup namespace
k3d cluster create inception --servers 1 --agents 1
kubectl create namespace argocd
kubectl create namespace dev

# Install Argo-CD on namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# Wait for pods to be running : kubectl get pods -n argocd -w
# Apply the argocd configuration
# Remember to change it according to your needs
kubectl apply -n argocd -f ./confs/argo-app.yaml
# Once running, get the argocd password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# Copy the password, you will need to use it to log in as admin
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Test the access :
# Find the pod name
# kubectl get pods -n dev
# kubectl exec <pod-name> -n dev -- wget -qO - localhost:8888
# Should show : {"status":"ok", "message": "v1"}