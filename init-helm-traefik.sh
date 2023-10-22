#!/bin/zsh

cd infra/helm/traefik
helm upgrade --install traefik -f values-dev.yaml . -n traefik