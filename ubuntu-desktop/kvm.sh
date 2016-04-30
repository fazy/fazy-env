#!/usr/bin/env bash

# Install KVM
sudo apt-get install -yq qemu-kvm libvirt-bin bridge-utils
sudo apt-get install -yq virt-manager
sudo apt-get install -yq qemu-system
sudo adduser $USER libvirtd
