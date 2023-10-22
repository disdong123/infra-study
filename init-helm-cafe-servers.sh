#!/bin/zsh

cd infra/helm/cafe-servers
helm upgrade --install cafe-servers .

sleep 3

curl coffee.myweb.com:30080
curl https://tea.myweb.com:30443 -k
curl https://www.myweb.com:30443/juice -k
curl https://www.myweb.com:30443/water -k