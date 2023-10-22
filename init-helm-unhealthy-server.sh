#!/bin/zsh

cd infra/helm/unhealthy-server
helm lint -f values-dev.yaml
helm upgrade --install unhealthy-server -f values-dev.yaml .