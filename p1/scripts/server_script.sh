#!/bin/bash
systemctl disable firewalld --now
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address=192.168.42.110 --flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -s -
cp /var/lib/rancher/k3s/server/token /vagrant_shared
# cp /etc/rancher/k3s/k3s.yaml /vagrant_shared
