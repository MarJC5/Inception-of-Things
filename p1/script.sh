#!/bin/bash

curl -sfL https://get.k3s.io | sh - 
# Wait for the start of k3s
echo "Wait k3s install"
sleep .35
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node
# Echo for end of installation
echo "Installation K3S Done."