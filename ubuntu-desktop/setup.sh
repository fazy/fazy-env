#!/usr/bin/env bash

### Set up a few things for my Linux Mint desktop machine...

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -yq upgrade
sudo apt-get -yq install \
    chromium-browser \
    colordiff \
    curl \
    dos2unix \
    git \
    htop \
    jq \
    whois \
    screen \
    tmux \
    vim

git config --global core.editor "vim"
git config --global push.default simple
git config --global core.excludesfile "~/.gitignore"

echo ".idea" > ~/.gitignore

for dir in ~/Music ~/Pictures ~/Public ~/Templates ~/Videos; do
    if [ -d $dir ]; then
        rmdir $dir --ignore-fail-on-non-empty
    fi
done

# Install Python PIP (will be needed for a couple of things)
sudo apt-get -yq install python-pip


# Install Docker
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository "deb https://apt.dockerproject.org/repo ubuntu-xenial main"
sudo apt-get update
sudo apt-get purge lxc-docker
sudo pip install docker-compose

sudo gpasswd -a `whoami` docker
sudo gpasswd -a `whoami` www-data

# Install AWS CLI tools
sudo pip install awscli

mkdir -p ~/.aws
cat <<END_OF_FILE > ~/.aws/config
[default]
output = json
region = eu-west-1
END_OF_FILE
