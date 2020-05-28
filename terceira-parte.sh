#!/usr/bin/env bash

# variaveis
senha='cp1113bug6u'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Tela de boas vindas
clear
echo -e "$seta ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 2s
clear

echo -e "${seta} ${blue}Atualizando os repositórios${end}"
echo $senha | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
echo $senha | sudo -S pacman -S nvidia nvidia-utils intel-ucode --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o cinnamon desktop${end}"
echo $senha | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-screensaver cinnamon-session cinnamon-settings-daemon --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o nemo${end}"
echo $senha | sudo -S pacman -S nemo nemo-preview nemo-share nemo-fileroller --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando pacotes necessários${end}"
echo $senha | sudo -S pacman -S accountsservice alsa-utils archlinux-keyring archlinux-wallpaper baobab bash-completion blueberry bluez bluez-cups bluez-tools bolt cmatrix colord coreutils cpio cronie dialog ffmpegthumbnailer gimp gnome-bluetooth gedit gnome-calculator gnome-calendar gnome-disk-utility gnome-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnome-system-monitor gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lollypop man-db metacity mtools neofetch pass rsync system-config-printer tcpdump totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics gnome-terminal xcursor-vanilla-dmz-aa xclip xreader youtube-dl --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando os pacotes necessários${end}"
echo $senha | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils edk2-ovmf spice-vdagent --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o daemon libvirt${end}"
echo $senha | sudo -S systemctl enable libvirtd.service
echo $senha | sudo -S systemctl start libvirtd.service
sleep 2s
clear

echo -e "${seta} ${blue}Inserindo $USER no grupo libvirt${end}"
echo $senha | sudo -S usermod -aG libvirt $USER
sleep 2s
clear

echo -e "${seta} ${blue}Para que o suporte de rede seja iniciado automáticamente${end}"
echo $senha | sudo -S virsh net-autostart --network default
sleep 2s
clear

echo -e "$seta ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o kid3-cli para o lollypop${end}"
yay -S --noconfirm kid3-cli
sleep 2s
clear

echo -e "$seta ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
yay -S --noconfirm aic94xx-firmware wd719x-firmware
sleep 2s
clear

echo -e "$seta ${blue}Instalando o debtap${end}"
yay -S --noconfirm debtap
sleep 2s
clear

echo -e "$seta ${blue}Instalando gnome-terminal-transparency${end}"
yay -S --noconfirm gnome-terminal-transparency
sleep 2s
clear

echo -e "$seta ${blue}Instalando cinnamon-sound-effects${end}"
yay -S --noconfirm cinnamon-sound-effects
sleep 2s
clear

echo -e "$seta ${blue}Instalando spotify${end}"
yay -S --noconfirm spotify
sleep 2s
clear

echo -e "$seta ${blue}Instalando o xviewer${end}"
yay -S --noconfirm xviewer xviewer-plugins
sleep 2s
clear

echo -e "$seta ${blue}Instalando as fontes${end}"
yay -S --noconfirm ttf-ms-fonts
yay -S --noconfirm ttf-ubuntu-font-family
sleep 2s
clear

echo -e "$seta ${blue}Instalando o mint-themes${end}"
yay -S --noconfirm mint-themes mint-y-icons mintlocale
sleep 2s
clear

echo -e "$seta ${blue}Instalando o gnome-online-accounts-git${end}"
yay -S --noconfirm gnome-online-accounts-git
sleep 2s
clear

echo -e "$seta ${blue}Instalando o google-chrome${end}"
yay -S --noconfirm google-chrome
sleep 2s
clear

echo -e "$seta ${blue}Iniciando o xdg-update${end}"
sleep 2s
if xdg-user-dirs-update; then
    echo -e "$seta ${green}xdg-update iniciado com sucesso!${end}"
    sleep 2s
    clear
else
    echo -e "$seta ${red}não foi possível iniciar o xdg-update!${end}"
    sleep 2s
    clear
    continue 
fi

echo -e "$seta ${blue}Instalando e iniciando o gdm${end}"
sleep 2s
echo $senha | sudo -S pacman -S gdm --noconfirm
echo $senha | sudo -S systemctl enable gdm
echo $senha | sudo -S systemctl start gdm

