#!/bin/bash
# curl -sfL https://get.k3s.io | sh -s - --server "https://192.168.42.110:6443" --write-kubeconfig-mode 644 --flannel-iface=eth1 --token-file "/vagrant_shared/token" --kubeconfig="/vagrant_shared/k3s.yaml"
curl -sfL https://get.k3s.io | KUBECONFIG=/vagrant_shared/k3s.yaml K3S_URL=https://192.168.42.110:6443 K3S_TOKEN_FILE=/vagrant_shared/token sh -