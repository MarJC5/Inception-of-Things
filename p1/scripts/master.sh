#!/bin/bash

# Install k3s as the server
curl -sfL https://get.k3s.io | sh -

# Wait for k3s to be fully up and running
echo "Wait for k3s server to start..."
sleep 35

# Output the node status to verify the server is up
sudo k3s kubectl get node

# Output the k3s token to a file so the agent node can use it to join
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/confs/k3s_token

echo "k3s server installation completed."