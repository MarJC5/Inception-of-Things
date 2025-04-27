#!/bin/bash

# Ensure the token file exists (waiting for the server to generate it)
while [ ! -f /vagrant/confs/k3s_token ]; do
    echo "Waiting for k3s token..."
    sleep 5
done

# Read the token from the file
K3S_TOKEN=$(cat /vagrant/confs/k3s_token)

# Install k3s as the agent node and join the server
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$K3S_TOKEN sh -

echo "k3s agent installation completed."