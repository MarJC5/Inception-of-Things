#!/bin/bash

export INSTALL_K3S_EXEC="--node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
# Install k3s as the server
curl -sfL https://get.k3s.io | sh -
until sudo k3s kubectl get node mpouceS | grep " Ready " &> /dev/null
do
    echo "Waiting for node to become Ready..."
    sleep 5
done

sudo kubectl apply -f '/vagrant/confs/*'

echo "k3s server installation completed."