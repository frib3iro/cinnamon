#!/usr/bin/env bash

# variaveis
user='fabio'
root='root'
pass_user='cp1113bug6u'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Funções ------------------------------------------------------------
driver_virtmanager(){
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

driver_nvidia(){
    echo $pass_user | sudo -S pacman -S nvidia nvidia-utils nvidia-settings intel-ucode --noconfirm
}
# GDM ----------------------------------------------------------------
instalar_gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
}
iniciar_gdm(){
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando...${end}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver virt-manager${end}"
echo -e "${seta} ${blue}Digite${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia${end}"
echo -en "${seta} ${yellow}Digite sua resposta:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    sleep 2s
    driver_virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    sleep 2s
    driver_nvidia
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "${seta} ${blue}Instalando o cinnamon desktop${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-screensaver cinnamon-session cinnamon-settings-daemon --noconfirm
clear

echo -e "${seta} ${blue}Instalando o nemo${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S nemo nemo-preview nemo-share nemo-fileroller --noconfirm
clear

echo -e "${seta} ${blue}Instalando pacotes necessários${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S accountsservice alsa-utils archlinux-keyring archlinux-wallpaper baobab bash-completion blueberry bluez bluez-cups bluez-tools bolt cmatrix colord coreutils cpio cronie dialog ffmpegthumbnailer gimp gnome-bluetooth gedit gnome-calculator gnome-calendar gnome-disk-utility gnome-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnome-system-monitor gnupg gst-libav gufw htop powerline-fonts libreoffice libreoffice-fresh-pt-br lollypop man-db metacity mtools neofetch pass rsync system-config-printer tcpdump totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip xreader youtube-dl --noconfirm
clear

echo -e "${seta} ${blue}Instalando o virt-manager${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils edk2-ovmf spice-vdagent --noconfirm
clear

echo -e "${seta} ${blue}Iniciando o daemon libvirt${end}"
sleep 2s
echo $pass_user | sudo -S systemctl enable libvirtd.service
echo $pass_user | sudo -S systemctl start libvirtd.service
clear

echo -e "${seta} ${blue}Inserindo o usuário no grupo libvirt${end}"
sleep 2s
echo $pass_user | sudo -S usermod -aG libvirt $USER
clear

echo -e "${seta} ${blue}Configurando a rede do virt-manager para iniciar automáticamente${end}"
sleep 2s
echo $pass_user | sudo -S virsh net-autostart --network default
clear

echo -e "${seta} ${blue}Instalando o yay${end}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

echo -e "${seta} ${blue}Instalando o timeshift${end}"
sleep 2s
yay -S timeshift --noconfirm
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${blue}Instalando aircrack-ng e usbutils${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils --noconfirm
clear

echo -e "${seta} ${blue}Instalando o crunch${end}"
sleep 2s
yay -S crunch --noconfirm
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${blue}Instalando o mint-backgrounds${end}"
sleep 2s
yay -S mint-backgrounds --noconfirm
clear

echo -e "${seta} ${blue}Instalando o gnome-terminal-transparency${end}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

echo -e "${seta} ${blue}Instalando o kid3-cli para o lollypop${end}"
sleep 2s
yay -S kid3-cli --noconfirm
clear

echo -e "${seta} ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

echo -e "${seta} ${blue}Instalando o debtap${end}"
sleep 2s
yay -S debtap --noconfirm
clear

echo -e "${seta} ${blue}Instalando cinnamon-sound-effects${end}"
sleep 2s
yay -S cinnamon-sound-effects --noconfirm
clear

echo -e "${seta} ${blue}Instalando spotify${end}"
sleep 2s
yay -S spotify --noconfirm
clear

echo -e "${seta} ${blue}Instalando o xviewer${end}"
sleep 2s
yay -S xviewer xviewer-plugins --noconfirm
clear

echo -e "${seta} ${blue}Instalando as fontes${end}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "${seta} ${blue}Instalando o mint-themes${end}"
sleep 2s
yay -S mint-themes mint-y-icons mintlocale --noconfirm
clear

echo -e "${seta} ${blue}Instalando o gnome-online-accounts-git${end}"
sleep 2s
yay -S gnome-online-accounts-git --noconfirm
clear

echo -e "${seta} ${blue}Instalando o google-chrome${end}"
sleep 2s
yay -S google-chrome --noconfirm
clear

echo -e "${seta} ${blue}Iniciando o xdg-update${end}"
xdg-user-dirs-update
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o gdm${end}"
sleep 2s
instalar_gdm 
clear

echo -e "${seta} ${blue}Iniciando o serviço do gdm${end}"
sleep 2s
iniciar_gdm
clear
