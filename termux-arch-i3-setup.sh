# update system
pacman -Sy

#create account
read user_name

useradd -m $user_name
passwd $user_name

# install needed packages
pacman --noconfirm -S sudo glibc i3 dmenu firefox alacritty neovim
# install all dependencies
pacman --noconfirm -Syu

# add user to sudoers
sed -i 's/root ALL=(ALL:ALL) ALL/root ALL=(ALL:ALL) ALL\n$user_name ALL=(ALL:ALL) ALL/' /etc/sudoers

# change to user
su $user_name

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install aur needed packages
yay -S dbus-x11-git

# install and configure oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install JetBrainsMono