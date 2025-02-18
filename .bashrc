# ~/.bashrc

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

[ -f /usr/share/bash-prexec ] && . /usr/share/bash-prexec
[ "$(command -v atuin)" ] && eval "$(atuin init bash --disable-up-arrow)"
[ "$(command -v zoxide)" ] && eval "$(zoxide init bash)"

