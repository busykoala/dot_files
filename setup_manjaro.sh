#!/usr/bin/bash

###################
# Install programs
###################

# Update database & upgrade
pacman -Syu --noconfirm

# Install Pacman Stuff
Programs="
terminator rofi git scrot gimp xbindkeys zsh zsh-completions
copyq xclip firefox fzf the_silver_searcher astyle ripgrep
docker mono go jdk8-openjdk cmake clang r base-devel make
libffi libyaml openssl zlib
"
for val in $Programs; do
    pacman -S --needed --noconfirm $val
done

# Install rust using rustup
su - busykoala -c "curl https://sh.rustup.rs -sSf | sh -s -- -y"
source /home/busykoala/.cargo/env

# Install ccls-git
echo "*** Start pulling and building ccls-git ***"
su - busykoala -c " git clone https://aur.archlinux.org/ccls-git.git ~/Downloads/ccls-git"
su - busykoala -c "cd ~/Downloads/ccls-git && makepkg -Si --needed"
su - busykoala -c "rm -rf ~/Downloads/ccls-git"

# Install pyenv
PYENV_REPO_FOLDER=/home/busykoala/.pyenv
PYENV_REPO_URL=https://github.com/pyenv/pyenv.git
if [ ! -d "$PYENV_REPO_FOLDER" ] ; then
	echo "The pyenv repo gets cloned"
	su - busykoala -c "git clone $PYENV_REPO_URL $PYENV_REPO_FOLDER"
else
	echo "The pyenv repos exists, it is getting pulled"
	git -C $PYENV_REPO_FOLDER pull
fi

RBENV_REPO_FOLDER=/home/busykoala/.rbenv
RBENV_REPO_URL=https://github.com/rbenv/rbenv.git
if [ ! -d "$RBENV_REPO_FOLDER" ] ; then
	echo "The rbenv repo gets cloned"
	git clone $RBENV_REPO_URL $RBENV_REPO_FOLDER
else
	echo "The rbenv repos exists, it is getting pulled"
	git -C $RBENV_REPO_FOLDER pull
fi
/home/busykoala/.rbenv/bin/rbenv init
mkdir -p /home/busykoala/.rbenv/plugins
RBENV_BUILD_REPO_FOLDER=/home/busykoala/.rbenv/plugins
RBENV_BUILD_REPO_URL=https://github.com/rbenv/ruby-build.git
if [ ! -d "$RBENV_BUILD_REPO_FOLDER" ] ; then
	echo "The rbenv repo gets cloned"
	git clone $RBENV_BUILD_REPO_URL $RBENV_BUILD_REPO_FOLDER
else
	echo "The rbenv repos exists, it is getting pulled"
	git -C $RBENV_BUILD_REPO_FOLDER pull
fi

# install exa (optimized ls)
if hash exa 2>/dev/null; then
    echo "exa exists already"
else
    cargo install exa
fi

# Install NVM
echo "*** Start pulling and building NVM ***"
su - busykoala -c "git clone https://aur.archlinux.org/nvm.git ~/Downloads/nvm"
su - busykoala -c "cd ~/Downloads/nvm && makepkg -Si --needed"
su - busykoala -c "rm -rf ~/Downloads/nvm"

# Set zsh shell
chsh -s /usr/bin/zsh busykoala
# Symlink xbindkeys
su - busykoala -c "ln -sf ~/dot_files/.xbindkeysrc ~/.xbindkeysrc"
# Symlink i3 config
su - busykoala -c "ln -sf ~/dot_files/.i3_config ~/.i3/config"
# Set background image
su - busykoala -c "cp -f ~/dot_files/assets/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg"

####################
# Dotfiles and Vim
####################

# combine vim repository
VIM_REPO_FOLDER=/home/busykoala/vim_config
VIM_REPO_URL=git@github.com:busykoala/vim_config.git
if [ ! -d "$VIM_REPO_FOLDER" ] ; then
	echo "The vim repo gets cloned"
	su - busykoala -c "git clone $VIM_REPO_URL $VIM_REPO_FOLDER"
else
	echo "The vim repos exists, it is getting pulled"
	su - busykoala -c "git -C $VIM_REPO_FOLDER pull"
fi

# Symlink .vimrc
ln -sf /home/busykoala/vim_config/.vimrc /home/busykoala/.vimrc
# Symlink does not work
cp -f /home/busykoala/vim_config/.editorconfig /home/busykoala/.editorconfig
# Clone Plug Installer
su - busykoala -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
# install vim plugins
su - busykoala -c "vim -c 'PlugInstall' -c 'qa!'"
su - busykoala -c "vim -c 'PlugClean' -c 'qa!'"
# Symlink dotfiles
ln -sf /home/busykoala/dot_files/.gitconfig /home/busykoala/.gitconfig
ln -sf /home/busykoala/dot_files/.gitignore /home/busykoala/.gitignore
ln -sf /home/busykoala/dot_files/.zshrc /home/busykoala/.zshrc
ln -sf /home/busykoala/dot_files/.isort.cfg /home/busykoala/.isort.cfg

echo "Sucessfully finished!"
echo ""
echo "######################"
echo "**TODO:**"
echo "- Vim, install coc-language servers"
echo "- Rbenv, install versions and set global"
echo "- Possibly the vim repo wasn't pulled correctly"
echo "######################"
