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

cd packages/server

echo "Try to create namespace"
kubectl create namespace dev

echo "Try to create config map"
kubectl apply -f ./infra/pok8s/dev/configmap.yaml

echo "Try to create redis"
kubectl apply -f ./infra/pok8s/dev/redis.deployment.yaml

echo "Try to create server deployment"
kubectl apply -f ./infra/pok8s/dev/server.deployment.yaml

echo "Try to create server nodeport"
kubectl apply -f ./infra/pok8s/dev/server.nodeport.yaml

sleep 7

curl http://localhost:30010/members/1