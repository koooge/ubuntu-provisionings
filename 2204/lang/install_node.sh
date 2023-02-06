#!/bin/bash -e

# Usage: `./install_node.sh`

NVM_VERSION="v0.39.1"
NODE_VERSION="lts/*"

install_nvm() {
  curl -sSo- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
  source ${HOME}/.nvm/nvm.sh
}

install_node() {
  nvm install ${NODE_VERSION}
  nvm use ${NODE_VERSION}
  nvm alias default ${NODE_VERSION}
}

install_nvm
install_node

nvm version
node -v
