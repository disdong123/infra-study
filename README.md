# monorepo-template

## Run
build context 를 확인해야합니다.

### Examples for running docker compose
```
docker build -t test -f packages/server/dockerfile . 
docker-compose -f packages/server/docker-compose.yaml up --build
```

### Examples for running k8s

```
bash ./packages/server/init.sh -b
```