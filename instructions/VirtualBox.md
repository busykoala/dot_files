# Setting up VirtualBox

```
# find out linux kernel version
uname -srm

# install
sudo pacman -S virtualbox virtualbox-guest-iso
# choose option according to output from above

# add user to vboxusers
sudo gpasswd -a $USER vboxusers

# load virtualbox kernel module
sudo modprobe vboxdrv

# install https://aur.archlinux.org/virtualbox-ext-oracle.git

# enable and start vboxweb
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service
```
