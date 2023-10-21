#!/bin/zsh

# redis
cd infra/helm/redis
helm lint -f values-dev.yaml
helm uninstall redis 2>/dev/null
helm install redis -f values-dev.yaml .