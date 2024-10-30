# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

# Set my $EDITOR to nvim or vim.
if [ "$(command -v nvim)" ]; then
  export EDITOR="nvim"
elif ! [ "$(command -v vim)" ]; then
  export EDITOR="nano"
else
  export EDITOR="vim"
fi

# Set up Node Version Manager if installed
if [ -f "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]; then
  NVM_DIR="$HOME/.local/share/nvm"
  if [ ! -d $NVM_DIR ]; then
    mkdir -p $NVM_DIR
  fi
  export NVM_DIR
  # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  # This loads nvm bash_completion
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

# Set up Virtualenvwrapper
if [ "$(command -v virtualenvwrapper.sh)" ]; then
  export WORKON_HOME="$HOME/.local/share/virtualenvs"
  source virtualenvwrapper.sh
fi
