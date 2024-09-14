# update system
pacman -Sy

#create account
read user_name

useradd -m $user_name
passwd $user_name

# install needed packages
pacman --noconfirm -S sudo glibc i3
# install all dependencies
pacman --noconfirm -Syu

# add user to sudoers
sed -i 's/root ALL=(ALL:ALL) ALL/root ALL=(ALL:ALL) ALL\n$user_name ALL=(ALL:ALL) ALL/' /etc/sudoers


su $user_name
sudo whoami