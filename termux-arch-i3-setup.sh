pacman -Sy
pacman --noconfirm -S sudo glibc

useradd -m -p . helixlit
sed 's/root ALL=(ALL:ALL) ALL/root ALL=(ALL:ALL) ALL\nhelixlit ALL=(ALL:ALL) ALL/' /etc/sudoers

su helixlit
sudo whoami