#!/bin/zsh

docker-compose -f packages/server/docker-compose.yaml up --build

sleep 5

curl http://localhost:3000/members/1