## Install
### Requirements
```sh
sudo dnf install -y alacritty bat curl fzf git tig htop jq make mc neovim nodejs openssl-devel zlib-devel perl-App-cpanminus starship the_silver_searcher tmux stow fd-find tree-sitter-cli httpie libyaml-devel
```

### Install flatpak applications
```sh
flatpak install -y com.bitwarden.desktop com.todoist.Todoist io.typora.Typora md.obsidian.Obsidian org.telegram.desktop us.zoom.Zoom
```

### Installing plugins for playing movies and music
[Source](https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/)
```sh
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
```

### Other Software
- [Nvidia drivers](https://rpmfusion.org/Howto/NVIDIA)
- [Docker](https://docs.docker.com/engine/install/ubuntu), [Docker Compose](https://docs.docker.com/compose/install/)
- [Slack](https://slack.com/intl/en-ua/downloads/linux)

### Font
[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

#### Another options:
[Hack](https://sourcefoundry.org/hack/)

### Clone and configure links
```sh
git clone git@github.com:ivleonov/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --verbose=2 alacritty bash neovim tmux vscode
```

### Tmux
[Plugin manager](https://github.com/tmux-plugins/tpm)
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
