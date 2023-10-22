#!/bin/zsh

kubectl delete all --all -n pok8s
kubectl delete all --all -n helm

# uninstall all helm
helm ls -a --all-namespaces | awk 'NR > 1 { print  "-n "$2, $1}' | xargs -L1 helm delete