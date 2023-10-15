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

cd infra/helm/redis

helm uninstall redis

helm install redis .

cd ../server

helm uninstall server

helm install server .

sleep 7

curl http://localhost:30020/members/1