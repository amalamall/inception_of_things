#!/bin/sh
#update
sudo apt-get update && sudo apt-get upgrade -y
# install HELM
sudo curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# install docker
# set up repository docker
sudo apt-get install ca-certificates curl gnupg lsb-release -y
# add docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo mv /usr/share/keyrings/docker-archive-keyring.gpg  /etc/apt/trusted.gpg.d/
sudo echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# update
sudo apt-get update && apt-get upgrade -y
# install docker
sudo apt-get install -y docker.io

# install k3d
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# install kubectl
# sudo snap install kubectl --classic#
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"  
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# install aptache2-utils
sudo apt-get install apache2-utils -y
