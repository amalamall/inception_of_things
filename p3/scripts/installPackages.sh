#!/bin/sh

# update
apt-get update && apt upgrade -y
apt install rsync net-tools -y
# install docker
# set up repository docker
apt-get install ca-certificates curl gnupg lsb-release -y
# add docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg -y
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# update
apt-get update && apt upgrade -y
# install docker
apt-get install -y docker.io

# install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash 

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# install aptache2-utils
apt install apache2-utils -y
