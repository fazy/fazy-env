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

