# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

# Set my $EDITOR to nvim or vim.
if command -v nvim 2>&1 >/dev/null; then
  export EDITOR="nvim"
elif command -v vim 2>&1 >/dev/null; then
  export EDITOR="vim"
fi

# Set up Node Version Manager if installed
if command -v nvm 2>&1 >/dev/null; then
  NVM_DIR="$HOME/.local/share/nvm"
  if [[ ! -d $NVM_DIR ]]; then
    mkdir -p $NVM_DIR
  fi
  export NVM_DIR
  # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  # This loads nvm bash_completion
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi
