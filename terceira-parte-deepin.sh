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
echo $senha | sudo -S pacman -Syyu
sleep 2s
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
echo $senha | sudo -S pacman -S xf86-video-intel intel-ucode --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o deepin desktop${end}"
echo $senha | sudo -S pacman -S deepin deepin-extra --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando compactadores de arquivos${end}"
echo $senha | sudo -S pacman -S unrar --noconfirm
clear

echo -e "$seta ${blue}Instalando pacotes necessários${end}"
echo $senha | sudo -S pacman -S accountsservice alsa-utils archlinux-keyring archlinux-wallpaper baobab bash-completion blueberry bluez bluez-cups bluez-tools bolt cmatrix colord coreutils cpio dialog ffmpegthumbnailer gimp gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lollypop man-db metacity mtools neofetch rsync system-config-printer tcpdump ttf-hack ufw xdg-user-dirs xdg-utils xf86-input-synaptics xfce4-terminal xorg xreader youtube-dl --noconfirm
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si PKGBUILD --noconfirm
sleep 2s
clear

# echo -e "$seta ${blue}Instalando spotify${end}"
# yay -S spotify --noconfirm
# sleep 2s
# clear
# 
# echo -e "$seta ${blue}Instalando o xviewer${end}"
# yay -S xviewer xviewer-plugins --noconfirm
# sleep 2s
# clear
# 
# echo -e "$seta ${blue}Instalando as fontes${end}"
# yay -S ttf-ms-fonts --noconfirm
# yay -S ttf-ubuntu-font-family --noconfirm
# sleep 2s
# clear
# 
# echo -e "$seta ${blue}Instalando o timeshift${end}"
# yay -S timeshift --noconfirm
# sleep 2s
# clear
 
echo -e "$seta ${blue}Instalando o google-chrome${end}"
yay -S google-chrome --noconfirm
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

echo -e "$seta ${blue}Instalando e iniciando o lightdm${end}"
sleep 2s
echo $senha | sudo -S pacman -S lightdm --noconfirm
echo -e "$seta ${blue}dite o arquivo de configuração do lightdm${end}"
echo -e "$seta ${blue}Adicione${end} ${yellow}greeter-session=lightdm-slick-greeter${end} ${blue}ao arquivo${end}"
echo -e "$seta ${yellow}Aperte uma tecla para continuar${end}"
read

echo -e "$seta ${blue}Instalando o lightdm-slick-greeter${end}"
yay -S lightdm-settings --noconfirm
yay -S lightdm-slick-greeter --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Habilitando o lightdm${end}"
lightdm --test-mode --debug
echo $senha | sudo -S systemctl enable lightdm 
echo $senha | sudo -S systemctl start lightdm 
sleep 2s
clear

