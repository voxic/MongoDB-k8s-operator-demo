#!/bin/bash -xe

# Set versions
HELM_VERSION=3.2.4
MICROK8S_VERSION=1.23

# Faster than VirtualBox's DNS Server
sed -i 's/127.0.0.53/1.1.1.1/' /etc/resolv.conf

# Install HELM
wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz
tar -xzf helm-v$HELM_VERSION-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v$HELM_VERSION-linux-amd64.tar.gz linux-amd64

swapoff -a
sed -i '/swap/d' /etc/fstab

# Install Microk8s
snap install microk8s --classic --channel=$MICROK8S_VERSION/stable

# Waits until K8s cluster is up
sleep 15

microk8s.enable dns
microk8s.enable metallb:192.168.56.100-192.168.56.200

mkdir -p /home/vagrant/.kube
microk8s config > /home/vagrant/.kube/config
usermod -a -G microk8s vagrant
chown -f -R vagrant /home/vagrant/.kube

# Install mongosh
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt-get update
apt-get install -y mongodb-mongosh