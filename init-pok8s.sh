#!/bin/zsh

build_image=false

while getopts "b" flag; do
    case "$flag" in
        b)
            build_image=true
            ;;
    esac
done

# -b 옵션
if [ "$build_image" = true ]; then
    echo "Try to build image"
    docker build -t server:latest -f packages/server/dockerfile .
fi

echo "Try to create namespace"
kubectl create namespace pok8s

echo "Try to create config map"
kubectl apply -f ./infra/pok8s/configmap.yaml

echo "Try to create redis"
kubectl apply -f ./infra/pok8s/redis.deployment.yaml

echo "Try to create server deployment"
kubectl apply -f ./infra/pok8s/server.deployment.yaml

echo "Try to create server nodeport"
kubectl apply -f ./infra/pok8s/server.nodeport.yaml

sleep 7

curl http://localhost:30010/members/1