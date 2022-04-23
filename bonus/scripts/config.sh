#!/bin/bash
sudo k3d cluster create my-cluster --api-port 6443  -p 8080:80@loadbalancer --port 8443:443@loadbalancer  --port 8888:8888@loadbalancer -p 80:8181@loadbalancer -p 31337:31337@loadbalancer

sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl create namespace gitlab

helm repo add gitlab https://charts.gitlab.io/
helm repo update
sudo kubectl create secret generic gitlab-gitlab-initial-root-password --from-literal=password="1337@LEET" -n gitlab
# --set global.initialRootPassword.secret=gitlab-gitlab-initial-root-password
sudo helm install --wait -n gitlab gitlab gitlab/gitlab --set global.initialRootPassword.secret=gitlab-gitlab-initial-root-password -f /confs/gitlab/values.yaml 
sudo kubectl patch svc gitlab-webservice-default -p '{"spec": {"type": "LoadBalancer"}}' -n gitlab



sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
ARGOCDINITIALPASS=1337@LEET
sudo kubectl patch secret   -n argocd argocd-secret  -p '{"stringData": { "admin.password": "'$(htpasswd -bnBC 10 "" ${ARGOCDINITIALPASS} | tr -d ':\n')'"}}'
sudo kubectl patch deploy argocd-server \
    -n argocd \
    -p '[{"op": "add", "path": "/spec/template/spec/containers/0/command/-", "value": "--insecure"}]' \
    --type json


sudo kubectl apply -f $(dirname "$0" | awk 'BEGIN{FS=OFS="/"}NF--')"/confs/argocd" -n argocd



echo "================= Admin Passowrd ================="
sudo kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' -n gitlab | base64 --decode ; echo



