#!/bin/bash -e

# Usage `./install_golang.sh && source ~/.bash_profile`

GO_VERSION=1.17.6

GO_URL=https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

install_golang() {
  wget -qO - ${GO_URL} | sudo tar zxC /usr/local

  cp ./.bash.d/go.sh ${HOME}/.bash.d/
  export PATH=${PATH}:/usr/local/go/bin
  export GOPATH=${HOME}/go
}

go_get_packages() {
#  go install golang.org/x/tools/cmd/godoc@latest
#  go install golang.org/x/tools/cmd/goimports@latest
#  go install golang.org/x/tools/cmd/gorename@latest
#  go install golang.org/x/tools/cmd/guru@latest

#  go install github.com/golang/lint/golint
  go install github.com/x-motemen/ghq@latest
	echo "" >> ~/.gitconfig
	echo "[ghq]" >> ~/.gitconfig
	echo "	root = ${HOME}/go/src" >> ~/.gitconfig
}

install_golang
go_get_packages

go version
