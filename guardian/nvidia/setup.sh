#!/usr/bin/env bash

################################################################################
# Install NVidia Drivers
# https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#ubuntu-lts

# Remove old drivers
sudo dpkg -P $(dpkg -l | grep nvidia | awk '{print $2}')
sudo apt autoremove

# Install new drivers
sudo apt-get install linux-headers-$(uname -r)
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update
sudo apt-get -y install cuda-drivers
sudo reboot

cat /proc/driver/nvidia/version
nvidia-smi

################################################################################
# Install Docker
# https://docs.docker.com/engine/install/ubuntu/

# Remove old Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Install latest Docker
# Installing the following together produced an error
curl https://get.docker.com | sh && sudo systemctl --now enable docker

# Optional: for development
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

################################################################################
# Install NVIDIA Container Toolkit
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
sudo ctr image pull docker.io/nvidia/cuda:11.0-base
sudo ctr run --rm --gpus 0 -t docker.io/nvidia/cuda:11.0-base cuda-11.0-base nvidia-smi

################################################################################
# Install k3s
# https://rancher.com/docs/k3s/latest/en/installation/install-options/#options-for-installation-with-script

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get all --all-namespaces

################################################################################
# Configure k3s to use nvidia-container-runtime
# https://itnext.io/enabling-nvidia-gpus-on-k3s-for-cuda-workloads-a11b96f967b0
# https://github.com/NVIDIA/k8s-device-plugin
# https://k3d.io/v5.2.0/usage/advanced/cuda/

sudo mkdir -p /var/lib/rancher/k3s/agent/etc/containerd/

sudo tee /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl > /dev/null <<EOF

[plugins.opt]
  path = "/var/lib/rancher/k3s/agent/containerd"

[plugins.cri]
  stream_server_address = "127.0.0.1"
  stream_server_port = "10010"
  enable_selinux = false
  sandbox_image = "rancher/pause:3.1"

[plugins.cri.containerd]
  disable_snapshot_annotations = true
  snapshotter = "overlayfs"

[plugins.cri.cni]
  bin_dir = "/var/lib/rancher/k3s/data/e61cd97f31a54dbcd9893f8325b7133cfdfd0229ff3bfae5a4f845780a93e84c/bin"
  conf_dir = "/var/lib/rancher/k3s/agent/etc/cni/net.d"

[plugins.cri.containerd.runtimes.runc]
  runtime_type = "io.containerd.runtime.v1.linux"

[plugins.linux]
  runtime = "nvidia-container-runtime"

EOF


# [plugins.cri.containerd.runtimes.runc]
#   runtime_type = "io.containerd.runc.v2"

sudo systemctl restart k3s

################################################################################
# Deploy the NVIDIA Driver helm chart
# https://github.com/NVIDIA/k8s-device-plugin#deployment-via-helm

helm repo add nvdp https://nvidia.github.io/k8s-device-plugin
helm repo update

helm install --version=0.10.0 --generate-name nvdp/nvidia-device-plugin

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: cuda-vector-add
spec:
  restartPolicy: OnFailure
  containers:
    - name: cuda-vector-add
      image: "k8s.gcr.io/cuda-vector-add:v0.1"
      resources:
        limits:
          nvidia.com/gpu: 1
EOF

kubectl logs -f cuda-vector-add

kubectl delete pod cuda-vector-add










cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: test-gpu
spec:
  restartPolicy: OnFailure
  containers:
    - name: test-gpu
      image: nvidia/cuda:11.0-base
      command: [ tail, -f, /dev/null ]
      resources:
        limits:
          nvidia.com/gpu: 1
EOF
