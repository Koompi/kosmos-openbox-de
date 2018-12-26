# SETUP KOSMOS DESKTOP ENVIRONMENT
## Setup yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..


## Setup xserver
sudo pacman -S xorg

## Setup display manager
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo systemctl enable lightdm.service

## Setup window manager
sudo pacman -S openbox obconf obmenu

## Setup terminal
sudo pacman -S gnome-terminal xterm

## Setup desktop env components
sudo pacman -S tint2 jgmenu plank nitrogen compton

## Setup file and disk management applications
sudo pacman -S nautilus gnome-disk-utility gnome-disks xarchiver

## Setup editors
sudo pacman -S gedit code atom

## Setup office
sudo pacman -S libreoffice-fresh

## Setup system setting tools
### Resource and Task Management
sudo pacman -S  gnome-system-monitor

### Authentication Manager
sudo pacman -S polkit-gnome

### Power Management
sudo pacman -S mate-power-manager

### Display Management
sudo pacman -S arandr

### Network Management
sudo pacman -S wpa_supplicant dialog networkmanager nm-connection-editor network-manager-applet openssh rsync samba
#### VPN
sudo pacman -S networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-vpnc
sudo systemctl enable NetworkManager.service

### Sound Manager
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf pavucontrol
yay -S --noconfirm volti

### Setup theme
sudo pacman -S lxappearance-gtk3 paper-icon-theme materia-gtk-theme adapta-gtk-theme 

### Setup printer
sudo pacman -S system-config-printer cups-pk-helper
yay -S --noconfirm gtklp

### File preference
yay -S --noconfirm obapps

### Key bindings
yay -S --noconfirm obkey-git

### Obmenu Generator
yay -S --noconfirm obmenu-generator
yay -S --noconfirm perl-gtk2-unique
sudo chmod 777 /usr/bin/obmenu-generator
sudo obmenu-generator -d -i -p
openbox --reconfigure

### Home Config
rsync -avz .config/* /home/kosmos/.config/
nitrogen --set-zoom-fill /home/$USER/.config/openbox/kosmos.jpg --save
tint2 -c /home/$USER/config/tint2/kosmos.tint2rc