#!/bin/bash
#sudo k3d cluster create my-cluster --api-port 6443 -p 8080:80@loadbalancer
k3d cluster create my-cluster
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
#chmod +x /usr/local/bin/argocd
#kubectl port-forward svc/argocd-server -n argocd 8080:443 --address='0.0.0.0' > /dev/null 0>&1 &
ARGOCDINITIALPASS=12341234
kubectl patch secret   -n argocd argocd-secret  -p '{"stringData": { "admin.password": "'$(htpasswd -bnBC 10 "" ${ARGOCDINITIALPASS} | tr -d ':\n')'"}}'
kubectl patch deploy argocd-server \
    -n argocd \
    -p '[{"op": "add", "path": "/spec/template/spec/containers/0/command/-", "value": "--insecure"}]' \
    --type json
cd ~
git clone https://github.com/amalamall/artam.git dev
kubectl apply -f ~/dev/config/deployment.yaml
kubectl apply -f ~/dev/config/service.yaml  
