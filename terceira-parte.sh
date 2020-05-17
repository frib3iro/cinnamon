#!/usr/bin/env bash

# variaveis
senha=cp1113bug6u
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Tela de boas vindas
clear
echo -e "$seta ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 1s
clear

# Configurando mirrorlist
echo -e "$seta ${blue}Instalando reflector${end}"
sleep 1s
echo $senha | sudo -S pacman -S reflector --noconfirm
clear

echo -e "$seta ${blue}Fazendo backup do mirrorlist${end}"
sleep 1s
echo $senha | sudo -S cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
clear

echo -e "$seta ${blue}Selecionando os espelhos mais rápidos${end}"
sleep 1s
echo $senha | sudo -S reflector -c Brazil -a  6 --sort rate --save /etc/pacman.d/mirrorlist
clear

echo -e "$seta ${blue}Atualizando os repositórios${end}"
sleep 1s
echo $senha | sudo -S pacman -Syyy
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
sleep 1s
echo $senha | sudo -S pacman -S xf86-video-intel --noconfirm
clear

echo -e "$seta ${blue}Instalando o ambiente Budgie e alguns pacotes${end}"
sleep 1s
clear
echo $senha | sudo -S pacman -S xorg budgie-desktop gdm gdm3setup gdm3setup-utils xfce4-terminal xdg-utils xdg-user-dirs archlinux-wallpaper system-config-printer dialog youtube-dl wget xf86-input-synaptics pavucontrol alsa-firmware alsa-utils alsa-plugins pulseaudio-alsa pulseaudio gimp libreoffice libreoffice-fresh-pt-br virtualbox virtualbox-guest-utils bash-completion bluez blueman bluez-utils --noconfirm

echo -e "$seta ${blue}Iniciando o gdm${end}"
sleep 1s
echo $senha | sudo -S systemctl enable gdm
clear

echo -e "$seta ${blue}Iniciando o Bluetooth${end}"
sleep 1s
echo $senha | sudo -S sudo systemctl enable bluetooth && sudo systemctl start bluetooth
clear

echo -e "$seta ${blue}Instalando o yay${end}"
sleep 1s
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si PKGBUILD --noconfirm
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Instalando as fontes${end}"
sleep 1s
yay -S ttf-ubuntu-font-family --noconfirm
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Instalando google-chrome${end}"
sleep 1s
yay -S google-chrome --noconfirm
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# echo -e "${seta} ${blue}Definindo o layout do teclado no ambiente cinnamon${end}"
# sleep 1s
# echo $senha | sudo -S cat >> '/etc/X11/xorg.conf.d/10-keyboard.conf' << EOF
# Section "InputClass"
    # Identifier "keyboard default"
    # MatchIsKeyboard "yes"
    # Option  "XkbLayout" "br"
    # Option  "XkbVariant" "abnt2"
# EndSection
# EOF
# echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
# read
# clear

echo -e "$seta ${blue}Reiniciando o sistema${end}"
sleep 1s
echo $senha | sudo -S reboot now
clear
