#!/usr/bin/env bash

GO_VERSION=1.6.2

# Install Go
curl -o /tmp/go$GO_VERSION.linux-amd64.tar.gz https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/go$GO_VERSION.linux-amd64.tar.gz

# Create lines for .profile
# http://unix.stackexchange.com/questions/88106/why-doesnt-my-bash-profile-work
cat <<END_OF_FILE
# Add these lines to ~/.profile
export GOPATH=\$HOME/go
export PATH=\$PATH:/usr/local/go/bin
export PATH=\$PATH:\$GOPATH/bin
END_OF_FILE
