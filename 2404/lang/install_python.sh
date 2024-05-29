#!/bin/bash -e

# Usage: `$ ./install_python.sh`

install_packages() {
  sudo apt update -qq && sudo apt install -y python3-pip python3-venv
  mkdir -p ${HOME}/.venv

  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
  sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

  echo 'export PATH=${PATH}:${HOME}/.local/bin' >> ${HOME}/.bash_profile
}

install_packages

python3 -V
pip3 -V
