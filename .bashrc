# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
elif [[ -f /etc/bash.bashrc ]]; then
  . /etc/bash.bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [[ -d ~/.bashrc.d ]]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

## From ublue bling
# ls aliases
if [[ "$(command -v eza)" ]]; then
  alias ll='eza -l --icons=auto --group-directories-first'
  alias l.='eza -d .*'
  alias ls='eza'
  alias l1='eza -1'
fi

# ugrep for grep
if [[ "$(command -v ug)" ]]; then
  alias grep='ug'
  alias egrep='ug -E'
  alias fgrep='ug -F'
  alias xzgrep='ug -z'
  alias xzegrep='ug -zE'
  alias xzfgrep='ug -zF'
fi

# bat for cat
if [[ "$(command -v bat)" ]]; then
  alias cat='bat --pager=none --style=plain'
fi

if [[ "$(basename "$SHELL")" = "bash" ]]; then
  #shellcheck disable=SC1091
  [ -f /home/linuxbrew/.linuxbrew/etc/profile.d/bash-preexec.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/bash-preexec.sh
  [ "$(command -v atuin)" ] && eval "$(atuin init bash --disable-up-arrow)"
  [ "$(command -v zoxide)" ] && eval "$(zoxide init bash)"
elif [ "$(basename "$SHELL")" = "zsh" ]; then
  [ "$(command -v atuin)" ] && eval "$(atuin init zsh)"
  [ "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
fi
# need to contribute back a way to configure the disable-up-arrow as an
# environment variable configuration
### bling.sh source start
#test -f /usr/share/ublue-os/bluefin-cli/bling.sh && source /usr/share/ublue-os/bluefin-cli/bling.sh
### bling.sh source end
