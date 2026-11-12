export GOPATH=${HOME}/go
export PATH=$PATH:/usr/local/go/bin:${GOPATH}/bin

alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
