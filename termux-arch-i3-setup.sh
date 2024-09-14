pacman -Sy

useradd -m helixlit
passwd helixlit
sed -i 's/root ALL=(ALL:ALL) ALL/root ALL=(ALL:ALL) ALL\nhelixlit ALL=(ALL:ALL) ALL/' /etc/sudoers

pacman --noconfirm -S sudo glibc

su helixlit
sudo whoami