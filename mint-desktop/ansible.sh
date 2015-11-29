#!/bin/bash

sudo apt-get -yq install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -yq install ansible

