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
volumeicon
pavucontrol
zathura
zathura-pdf-mupdf
xournalpp
nautilus
gnome-disk-utility
noto-fonts-emoji
obs-studio
v4l2loopback-dkms
k9s
keepassxc
"
for val in $Programs; do
    pacman -S --needed --noconfirm $val
done

# pavucontrol instead of pulseaudio in volumeicon...
