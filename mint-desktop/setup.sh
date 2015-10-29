#!/bin/bash

### Set up a few things for my Linux Mint desktop machine...

GIT_USER_EMAIL="lars@fazy.net"
GIT_USER_NAME="Lars Janssen"

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -yq upgrade
sudo apt-get -yq install \
    chromium-browser \
    colordiff \
    curl \
    dos2unix \
    git \
    jq \
    vim

curl -o ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml \
    https://raw.githubusercontent.com/fazy/fazy-env/master/mint-desktop/gnome-terminal.xml

git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git config --global core.editor "vim"
git config --global push.default simple
git config --global core.excludesfile "~/.gitignore"

echo ".idea" > ~/.gitignore

for dir in ~/Music ~/Pictures ~/Public ~/Templates ~/Videos; do
    if [ -d $dir ]; then
        rmdir $dir --ignore-fail-on-non-empty
    fi
done

cat <<END_OF_FILE > ~/.bashrc
alias vi=vim
END_OF_FILE

chmod u+x ~/.bashrc

# Install Python PIP (will be needed for a couple of things)
sudo apt-get -yq install python-pip

# Install Docker
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
foundRepo=$(grep apt.dockerproject.org /etc/apt/sources.list.d/additional-repositories.list)
if [ -z "$foundRepo" ]; then
    sudo apt-add-repository "deb https://apt.dockerproject.org/repo ubuntu-trusty main"
fi

sudo apt-get update
sudo apt-get -yq install docker-engine
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

# MySQL workbench
apt-get -yq install mysql-workbench

# Install KVM
sudo apt-get install -yq qemu-kvm libvirt-bin bridge-utils
sudo apt-get install -yq virt-manager
sudo apt-get install -yq qemu-system
sudo adduser $USER libvirtd

