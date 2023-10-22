#!/bin/zsh

# redis
cd infra/helm/redis
helm lint -f values-dev.yaml
helm upgrade --install redis -f values-dev.yaml .