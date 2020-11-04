# Install Pacman Stuff
Programs="
terminator
git
scrot
gimp
xbindkeys
zsh
zsh-completions
copyq
xclip
firefox
chromium
terminator
ripgrep
cmake
base-devel
make
libffi
libyaml
openssl
zlib
java11-openjdk
pulseaudio-bluetooth
virtualbox-guest-iso
virtualbox
keychain
exa
yarn
owncloud-client
xorg-xrandr
thunderbird
arandr
dnsutils
"
for val in $Programs; do
    pacman -S --needed --noconfirm $val
done
