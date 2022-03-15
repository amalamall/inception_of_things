#!/bin/bash
sudo systemctl disable firewalld --now
sudo systemctl stop firewalld --now
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address=192.168.42.110 --flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -s -
kubectl apply -f /confs/deployments.yaml  -n kube-system
kubectl apply -f /confs/services.yaml  -n kube-system
kubectl apply -f /confs/ingress.yaml  -n kube-system
