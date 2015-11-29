#!/bin/bash

curl -o /tmp/vagrant.deb https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb
sudo dpkg -i /tmp/vagrant.deb

curl -o /tmp/virtualbox.deb http://download.virtualbox.org/virtualbox/5.0.10/virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb
sudo dpkg -i /tmp/virtualbox.deb

#sudo apt-get -yq install virtualbox

