#!/bin/bash -e

# Usage: `./install_ruby.sh`

RUBY_VERSION=3.0.2

install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src && cd -
  ~/.rbenv/bin/rbenv init

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init - bash)"' >> ~/.bash_profile
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
}

install_ruby_build() {
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
}

install_ruby() {
  rbenv install ${RUBY_VERSION}
  rbenv local ${RUBY_VERSION}
  rbenv global ${RUBY_VERSION}
  rbenv rehash

  gem update --system
  gem update
  gem install pry pry-doc --force --no-document
}

install_mruby() {
  git clone https://github.com/mruby/mruby.git $HOME/mruby
  cd $HOME/mruby
  ./minirake
  cd -

  gem install mgem --no-document
}

install_rbenv
install_ruby_build
install_ruby
# install_mruby

rbenv -v
ruby -v
