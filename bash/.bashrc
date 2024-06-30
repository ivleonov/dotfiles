# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# https://starship.rs/
eval "$(starship init bash)"

# Enable Nord theme for bat
export BAT_THEME="Nord"

export EDITOR=nvim

# Disabling DRI3 to fix issue wit external monitor:
# When disabling primary display (on the laptop) and using only external one
# the anymation is crazy lagging (like 1 FPS)
# More info here:
# - https://github.com/DisplayLink/evdi/issues/181
# - https://gitlab.freedesktop.org/xorg/xserver/-/issues/1028#note_1067790
#
# Side-effect: when disabled - alacritty is lagging:
# doesn't show recently typed symbol (exactly the last one)
# export LIBGL_DRI3_DISABLE="true"

# Command for searching ruby stuff in cheat.sh
function rcheat {
  curl "cheat.sh/ruby/$(echo $@ | tr ' ' '+')"
}

# aliases
# Runs nvim based on lazyvim config placed in ~/.config/lazyvim/
alias lvim="NVIM_APPNAME=lazyvim nvim"

export SECOND_BRAIN_DIR="$HOME/Documents/Obsidian"
alias oo='nvim -c "cd $SECOND_BRAIN_DIR" -c "Telescope find_files"'

# Setting up fzf integration
# https://github.com/junegunn/fzf/blob/8db65704b9491bc9e3015f9568df79f0930c85ca/README.md#setting-up-shell-integration
eval "$(fzf --bash)"
