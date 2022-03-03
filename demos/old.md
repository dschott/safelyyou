## 2021-12-07

- Guardian SSH Jax
- Image Build
  - `build-image.yaml`
- K3s Setup
  - `k3s-setup.md`
  - `kubectl get all --all-namespaces`
- Deployment
  - Script
    - `deploy/scripts/deploy --chart guardian --tag 6.0.0-39-g598c08c`
    - `kubectl get all`
    - `kubectl exec -it guardian- -- bash`
    - `nvidia-smi`
    - Local IP
    - AWS token secret
  - Chart
    - Local Values
- Next Steps
  - Mock camera chart
  - Deploy image Github Action for dev / stage
- Breifly mention draft Guardian 2.x

# Containerized

dc up -d
.env
conf/test/settings.override.json
logs
camera AI
Sky

# Kubernetes

# Helm charts

./deploy/deploy-guardian.sh 6.0.0-37-g20d4631-dirty
315020830454.dkr.ecr.us-west-2.amazonaws.com/guardian:6.0.0-37-g20d4631-dirty

# GPUs Available in docker

sudo docker run --gpus all nvidia/cuda:11.0-base nvidia-smi

# Available in Containerd

sudo ctr run --rm --gpus 1 -t docker.io/nvidia/cuda:11.0-base cuda-11.0-base nvidia-smi

# Not quite ready in Kube

# https://github.com/k3s-io/k3s/issues/1427

kubectl get all
kubectl get pod/gpu
