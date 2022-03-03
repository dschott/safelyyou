#!/usr/bin/env bash

# uninstall sudo /usr/local/bin/k3s-uninstall.sh

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 0644
