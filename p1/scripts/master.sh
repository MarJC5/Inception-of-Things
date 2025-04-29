#!/bin/bash

export INSTALL_K3S_EXEC="--node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
# Install k3s as the server
curl -sfL https://get.k3s.io | sh -

# Wait for k3s to be fully up and running
until sudo k3s kubectl get node mpouceS | grep " Ready " &> /dev/null
do
    echo "Waiting for node to become Ready..."
    sleep 5
done

# Output the k3s token to a file so the agent node can use it to join
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/confs/k3s_token

echo "k3s server installation completed."