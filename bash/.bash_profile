# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"
