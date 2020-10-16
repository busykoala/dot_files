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
java11-openjfx
pulseaudio-bluetooth
virtualbox-guest-iso
virtualbox
"
for val in $Programs; do
    pacman -S --needed --noconfirm $val
done

# set time (teams issue sso)
# ntpd -qg
