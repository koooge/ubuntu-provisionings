#!/bin/bash -e

# Usage: `./install_java.sh && . ~/.bashrc`

install_sdkman() {
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

install_java() {
  sdk install java
}

install_build_system() {
  sdk install gradle
}

install_sdkman
install_java
install_build_system

source ${HOME}/.bash_profile
sdk version
java -version
gradle -v
