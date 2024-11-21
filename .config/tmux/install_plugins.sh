#!/usr/bin/env bash

# Install TPM plugins.
# TPM requires running tmux server, as soon as `tmux start-server` does not work
# create dump __noop session in detached mode, and kill it when plugins are installed

if [[ ! -d $HOME/.config/tmux/plugins/tpm ]]; then
  echo "installing tpm"
  git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi

printf "Install TPM plugins\n"
tmux new -d -s __noop >/dev/null 2>&1 || true
tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.config/tmux/plugins"
"$HOME"/.config/tmux/plugins/tpm/bin/install_plugins || true
tmux kill-session -t __noop >/dev/null 2>&1 || true