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
    docker build -t helm-server:latest -f packages/server/dockerfile .
fi



# redis
cd infra/helm/redis
helm lint -f values-dev.yaml
helm uninstall redis 2>/dev/null
helm install redis -f values-dev.yaml .

# server
cd ../server
helm lint -f values-dev.yaml
helm uninstall server 2>/dev/null
helm install server -f values-dev.yaml .

echo "Wait for 10 seconds..."
sleep 10

curl http://localhost:30020/members/1