#!/usr/bin/env bash

## Nvidia Driver Container
# https://docs.nvidia.com/datacenter/cloud-native/driver-containers/overview.html

##
## ENSURE DOCKER INSTALLED
##

################################################################################
# Install Nvidia Driver
################################################################################
#
# Pre-requisites
#
sudo apt-get update
sudo apt-get -y install gcc-5 g++-5
sudo apt-get -y install "linux-headers-$(uname -r)"

#
# Install Cuda Drivers
#
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update
sudo apt-get -y --no-install-recommends install cuda-drivers

sudo reboot


################################################################################
# Install Nvidia Container Toolkit
################################################################################

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y --no-install-recommends nvidia-docker2
sudo systemctl restart docker

# Test
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi


################################################################################
# Configure Container Driver Support
################################################################################

# I think to get this to work, all NVidia drivers need to be uninstalled first and
# then all steps in this script need to be run again.

# Disable the Nouveau driver modules
sudo tee /etc/modules-load.d/ipmi.conf <<< "ipmi_msghandler" \
  && sudo tee /etc/modprobe.d/blacklist-nouveau.conf <<< "blacklist nouveau" \
  && sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf <<< "options nouveau modeset=0"

# Update the initramfs
sudo update-initramfs -u

# Now modify the configuration to update the root directive:
#
# I backed this change out... Kept getting driver in use errors
sudo sed -i 's/^#root/root/' /etc/nvidia-container-runtime/config.toml

sudo reboot

# Test

# Run driver container
# I think I need to somehow disable the GPU drivers on the host
# Keep getting this error:
# ========== NVIDIA Software Installer ==========

# Starting installation of NVIDIA driver version 460.73.01 for Linux kernel version 4.15.0-162-generic

# Stopping NVIDIA persistence daemon...
# Unloading NVIDIA driver kernel modules...
# Could not unload NVIDIA driver kernel modules, driver is in use
# Stopping NVIDIA persistence daemon...
# Unloading NVIDIA driver kernel modules...
# Could not unload NVIDIA driver kernel modules, driver is in use
sudo docker run --name nvidia-driver -d --privileged --pid=host \
  -v /run/nvidia:/run/nvidia:shared \
  -v /var/log:/var/log \
  --restart=unless-stopped \
  nvidia/driver:460.73.01-ubuntu18.04

# Run GPU Container
sudo docker run --gpus all nvidia/cuda:11.0-base nvidia-smi

# LATEST: 495.29.05
# LATEST nvidia/driver docker: 460.73.01-ubuntu18.04




# Got this during install:
# Possible missing firmware /lib/firmware/ast_dp501_fw.bin for module ast
