export GOPATH=${HOME}/go
export PATH=$PATH:/usr/local/go/bin:${GOPATH}/bin

alias g='cd $(ghq root)/$(ghq list | peco)'
