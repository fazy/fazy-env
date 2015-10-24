#!/bin/bash

### Set up a few things for my Linux Mint desktop machine...

GIT_USER_EMAIL="lars@fazy.net"
GIT_USER_NAME="Lars Janssen"

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -yq upgrade
sudo apt-get -yq install \
    chromium-browser \
    curl \
    git \
    vim

curl -o ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml \
    https://raw.githubusercontent.com/fazy/fazy-env/master/mint-desktop/gnome-terminal.xml

git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME
git config --global core.editor "vim"
git config --global push.default simple

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

