#!/bin/bash -e

# Usage: `./install_rust.sh`

install_rust() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env

  rustup component add clippy
}

install_crates() {
  cargo install cargo-watch
}

install_rust
install_crates

rustup show
cargo --version
