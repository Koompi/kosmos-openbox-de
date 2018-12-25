# SETUP KOSMOS DESKTOP ENVIRONMENT
## Setup yaourt
sudo pacman -S --needed base-devel git wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si && cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si && cd ..
rm -rf package-query
rm -rf yaourt

## Setup xserver
sudo pacman -S xorg -y

## Setup display manager
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings -y
sudo systemctl enable lightdm.service

## Setup window manager
sudo pacman -S openbox obconf obmenu -y

## Setup terminal
sudo pacman -S gnome-terminal xterm -y

## Setup desktop env components
sudo pacman -S tint2 jgmenu plank nitrogen compton -y

## Setup file and disk management applications
sudo pacman -S nautilus gnome-disk-utility gnome-disks xarchiver -y

## Setup editors
sudo pacman -S gedit code atom -y

## Setup office
sudo pacman -S libreoffice-fresh -y

## Setup system setting tools
### Resource and Task Management
sudo pacman -S  gnome-system-monitor -y

### Authentication Manager
sudo pacman -S polkit-gnome -y

### Power Management
sudo pacman -S mate-power-manager -y

### Display Management
sudo pacman -S arandr -y

### Network Management
sudo pacman -S wpa_supplicant dialog networkmanager nm-connection-editor network-manager-applet openssh rsync samba -y
#### VPN
sudo pacman -S networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-vpnc -y
sudo systemctl enable NetworkManager.service

### Sound Manager
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf pavucontrol
yaourt -S volti -y

### Setup theme
sudo pacman -S lxappearance-gtk3 paper-icon-theme materia-gtk-theme adapta-gtk-theme 

### Setup printer
sudo pacman -S system-config-printer cups-pk-helper
yaourt -S gtklp

### File preference
yaourt -S obapps

### Key bindings
yaourt -S obkey-git

### Obmenu Generator
yaourt -S obmenu-generator
yaourt -S perl-gtk2-unique
sudo chmod 777 /usr/bin/obmenu-generator
sudo obmenu-generator -d -i -p
openbox --reconfigure

### Home Config
rsync -avz .config/* /home/kosmos/.config/
nitrogen --set-zoom-fill /home/$USER/.config/openbox/kosmos.jpg --save
tint2 -c /home/$USER/config/tint2/kosmos.tint2rc