#!/bin/bash
# curl -sfL https://get.k3s.io | sh -s - --server "https://192.168.42.110:6443" --write-kubeconfig-mode 644 --flannel-iface=eth1 --token-file "/vagrant_shared/token" --kubeconfig="/vagrant_shared/k3s.yaml"
# echo "export KUBECONFIG=/vagrant_shared/k3s.yaml" >> .bashrc
echo "export K3S_URL=https://192.168.42.110:6443" >> .bashrc
echo "export K3S_TOKEN_FILE=/vagrant_shared/token" >> .bashrc
# curl -sfL https://get.k3s.io | KUBECONFIG=$KUBECONFIG K3S_URL=$K3S_URL K3S_TOKEN_FILE=$K3S_TOKEN_FILE sh - --flannel-iface eth1
curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN_FILE=$K3S_TOKEN_FILE  sh -s - --flannel-iface eth1