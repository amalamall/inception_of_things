#!/bin/bash
k3d cluster create my-cluster --api-port 6443 -p 8080:80@loadbalancer --port 8443:443@loadbalancer  --port 8888:8888@loadbalancer
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
ARGOCDINITIALPASS=1337@LEET
kubectl patch secret   -n argocd argocd-secret  -p '{"stringData": { "admin.password": "'$(htpasswd -bnBC 10 "" ${ARGOCDINITIALPASS} | tr -d ':\n')'"}}'
kubectl patch deploy argocd-server \
    -n argocd \
    -p '[{"op": "add", "path": "/spec/template/spec/containers/0/command/-", "value": "--insecure"}]' \
    --type json
kubectl apply -f $(dirname "$0" | awk 'BEGIN{FS=OFS="/"}NF--')"/confs" -n argocd