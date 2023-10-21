#!/bin/zsh

cd infra/helm/unhealthy-server
helm lint -f values-dev.yaml
helm uninstall unhealthy-server 2>/dev/null
helm install unhealthy-server -f values-dev.yaml .