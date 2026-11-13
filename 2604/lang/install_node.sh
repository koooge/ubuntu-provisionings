#!/bin/bash
set -eo pipefail

NODE_VERSION="lts/*"

install_nvm() {
  local nvm_version
  nvm_version=$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -er '.tag_name')
  curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_version}/install.sh" | bash
  source "${HOME}/.nvm/nvm.sh"
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
