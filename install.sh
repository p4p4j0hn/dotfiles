#!/usr/bin/env bash

set -oeux pipefail

# need to install myrepos and vcsh before running this script
# NOTE: this needs to be run in a bare shell. ie: it cannot be run
#       within a tmux session in order to install the tmux plugins

sudo apt update

for PACKAGE in $(cat debian-packages.txt); do
  if ! sudo apt install -y $PACKAGE; then
    echo "WARNING: ${PACKAGE} not available"
  else
    echo "OK: ${PACKAGE} is installed"
  fi
done

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

# Install bash-prexec if required
if ! [[ -f "$HOME/.local/share/bash-preexec.sh" ]]; then
  curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o "$HOME/.local/share/bash-preexec.sh"
fi

# Install atuin if required


clone-dotfiles

# Install tmux plugins
install-tmux-plugins
