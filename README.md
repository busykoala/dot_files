# Setup Manjaro (i3wm)

Dotfiles for a manjaro setup.

*Hints:*

  - `mod` is the windows key
  - `mod + p` to take screenshots (selection) -> to clipboard
  - `ctrl + alt + h` for the `Show the tray menu` in CopyQ (set yourself)

## Setup dotfiles

Get Manjaro with i3wm from `https://manjaro.org/download/i3/`.
Username is busykoala for all examples.

### Setup ssh keys

```
# put your keys into ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
# add the public key to the git remote
```

### Clone repository

```
git clone git@github.com:busykoala/dot_files.git ~/dot_files
```

### Install packaged programs

```
sudo ./programs.sh
```

### Fix time issue

```
sudo ntpd -qg
sudo hwclick --systohc
```

### vim, zshell and symlinks

See in the vim_config repo for more infos.

```
# set zshell
chsh -s /usr/bin/zsh busykoala
# symlink everything
./symlink.sh
```

### Background (Wallpaper)

The backgrounds are located at `/usr/share/backgrounds/` and the used one can
simply be replaced.

### Manually install these things

#### From AUR

```
# Install from AUR
git clone https://aur.archlinux.org/teams.git ~/Downloads/teams
cd ~/Downloads/teams
makepkg
sudo pacman -U teams-a.b.pkg.tar.xz
```

- teams
- google-chrome

#### From source (other than AUR)

```
# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
```

Rust: https://rustup.rs/
Poetry: https://python-poetry.org/docs/#installation
