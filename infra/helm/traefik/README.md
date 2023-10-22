#

## Install
```
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm pull traefik/traefik
tar xvfz traefik-10.3.0.tgz
```

## Admin page
```
http://localhost:9000/dashboard/#
```

### values-dev.yaml
- namespace: traefik
- service type: nodeport
- web nodeport: 30080
- websecure nodeport: 30443

## Docs
https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart