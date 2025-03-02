#!/usr/bin/env bash

set -oeux pipefail

clone-dotfiles() {
  # Clone mr branch
  pushd $HOME
  if ! [[ -d $HOME/.config/vcsh/repo.d/mr.git ]]; then
    vcsh clone -b mr https://github.com/p4p4j0hn/dotfiles mr
  fi
  popd

  # Checkout all vcsh repos
  pushd $HOME
  mv .bashrc .bashrc.bak
  mv .profile .profile.bak
  mr checkout
  popd
}

install-tmux-plugins() {
  # Install tmux plugins
  echo "Installing tmux plugins"
  $HOME/.config/tmux/install_plugins.sh
}

# if in a devcontainer, just clone the dotfiles
if [[ -v DEVCONTAINER ]]; then
  clone-dotfiles
  install-tmux-plugins
  echo 'eval "$(starship init bash)"' | sudo tee -a /etc/bash.bashrc
  mkdir -p $HOME/.ssh
  chmod 700 $HOME/.ssh
  echo "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEZn+WQaOkErHh/HdYAigbhaGVpexvzAnUr47T38RnChAAAABHNzaDo= john@schmidthaus.rocks" >$HOME/.ssh/authorized_keys
  exit
fi

# Install starship if required
if ! [[ "$(command -v starship)" ]]; then
  curl -sS https://starship.rs/install.sh | sudo sh -s -- -y -b /usr/local/bin
fi

# Install bash-prexec if required
if ! [[ -f "$HOME/.local/share/bash-preexec.sh" ]]; then
  curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o "$HOME/.local/share/bash-preexec.sh"
fi

# Install brew if required
#if ! [[ -d /home/linuxbrew/.linuxbrew ]]; then
#  /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#  sudo cp -r $HOME/dotfiles/files/brew/* /etc/profile.d/
#fi

# source brew environment if it doesn't already exist
#if ! [[ "$(command -v brew)" ]]; then
#  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#fi

# Install myrepos and vcsh from brew
#brew install myrepos vcsh

clone-dotfiles

# install brew applications
#pushd "$HOME/.config/brew"
#if ! [[ -f brew-init-done ]]; then
#  brew bundle --file common.Brewfile --no-lock
#  touch brew-init-done
#fi
#popd

# Install tmux plugins
#install-tmux-plugins
