#!/bin/bash -e

# Usage `./install_golang.sh && source ~/.bash_profile`

GO_VERSION=1.14.6

GO_URL=https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

install_golang() {
  wget -qO - ${GO_URL} | sudo tar zxC /usr/local

  cp ./.bash.d/go.sh ${HOME}/.bash.d/
  export PATH=${PATH}:/usr/local/go/bin
  export GOPATH=${HOME}/go
}

go_get_packages() {
  go get golang.org/x/tools/cmd/godoc
  go get golang.org/x/tools/cmd/goimports
#  go get golang.org/x/tools/cmd/gorename
#  go get golang.org/x/tools/cmd/guru

#  go get github.com/golang/lint/golint
  go get github.com/motemen/ghq
	echo "" >> ~/.gitconfig
	echo "[ghq]" >> ~/.gitconfig
	echo "	root = ${HOME}/go/src" >> ~/.gitconfig
}

install_golang
go_get_packages

go version
