# Infra study

Devops/Infra 관련 학습을 위한 저장소입니다.

## Run
docker build 시 docker client 는 build context 내의 모든 파일을 docker daemon 에 전달합니다.
즉, docker daemon 은 현재 build context 상위의 파일을 알 수 없으므로 build 중에 상위 디렉토리 파일을 COPY 할 수 없습니다.

여기서는 현재 build context 를 최상위로 두어 실행합니다.

### Run sh
```
# example
bash init-pok8s-rbac.sh
```

### Create helm
```
# example
helm create ./packages/server/infra/helm
```

## Docs
