# Install Citrix

```
# install dependencies
sudo pacman -S libpng12 libxp libjpeg6-turbo libidn11

# install icaclient from AUR
git clone https://aur.archlinux.org/icaclient.git ~/Downloads
cd ~/Downloads/icaclient
makepkg
sudo pacman -U icaclient.a.b.pkg.tar.xz
```

Follow the install instructions (from output):
```
mkdir -p $HOME/.ICAClient/cache
cp /opt/Citrix/ICAClient/config/{All_Regions,Trusted_Region,Unknown_Region,canonicalization,regions}.ini $HOME/.ICAClient/
```
