#!/bin/bash
k3d cluster create my-cluster --api-port 6443 -p 8080:80@loadbalancer --port 8443:443@loadbalancer  --port 8888:8888@loadbalancer
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
kubectl apply -f $PWD/../confs/
