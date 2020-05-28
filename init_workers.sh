#!/bin/bash

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Join node to Kubernetes Cluster"
apt-get install -y sshpass >/dev/null 2>&1
sshpass -p "kubeadmin" scp -o StrictHostKeyChecking=no master.home.lab:/joincluster.sh /joincluster.sh
bash /joincluster.sh >/dev/null 2>&1
