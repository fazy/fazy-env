#!/bin/bash

### Helper to install Oracle Java

INSTALL_DIR=/opt/java/64

if [ -e $INSTALL_DIR ]; then
    echo "Java is already installed."
    exit 1
fi

java=$1
if [ -z $java ]; then
    echo "Get Java from http://www.java.com/en/ and run:"
    echo "$0 <path-to-java-download.tar.gz>"
    exit 1
fi

sudo mkdir -p $INSTALL_DIR
cd $downloadDir
sudo tar xfz $java -C $INSTALL_DIR

javaVersion=$(ls $INSTALL_DIR)
javaBinPath="$INSTALL_DIR/$javaVersion/bin/java"
sudo update-alternatives --install "/usr/bin/java" "java" "$javaBinPath" 1
sudo update-alternatives --set java "$javaBinPath"

