# update system
pacman -Sy

#create account
read user_name

useradd -m $user_name
passwd $user_name

# install needed packages
pacman --noconfirm -S sudo glibc i3 kitty dmenu firefox
# install all dependencies
pacman --noconfirm -Syu

# add user to sudoers
sed -i 's/root ALL=(ALL:ALL) ALL/root ALL=(ALL:ALL) ALL\n$user_name ALL=(ALL:ALL) ALL/' /etc/sudoers

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install aur needed packages
yay -S dbus-x11-git