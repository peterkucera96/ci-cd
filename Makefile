IMAGE=ghcr.io/your-gh-username/ci-cd-docker-k8s-demo
SHA=$(shell git rev-parse --short HEAD)

run:
\tdocker build -t $(IMAGE):dev .
\tdocker run -p 8080:8080 $(IMAGE):dev

kind-up:
\tkind create cluster --name demo || true
\tkubectl cluster-info

k8s-apply:
\tsed "s/{{GIT_SHA}}/$(SHA)/g" k8s/deployment.yaml | kubectl apply -f -
\tkubectl apply -f k8s/service.yaml
\tkubectl rollout status deploy/demo-web

port-forward:
\tkubectl port-forward svc/demo-web 8080:80

