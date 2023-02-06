#!/bin/bash -ex

sudo apt-get update -qq && sudo apt-get install -y apt-transport-https
curl -sS https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update -qq
sudo apt-get install -y kubectl
