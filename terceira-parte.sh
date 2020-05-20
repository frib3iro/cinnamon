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
sleep 1s
clear

echo -e "${seta} ${blue}Atualizando os repositórios${end}"
sleep 1s
echo $senha | sudo -S pacman -Syyy
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
sleep 1s
echo $senha | sudo -S pacman -S xf86-video-intel intel-ucode --noconfirm
clear

echo -e "$seta ${blue}Instalando o cinnamon desktop${end}"
sleep 1s
echo $senha | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-screensaver cinnamon-session cinnamon-settings-daemon --noconfirm
clear

echo -e "$seta ${blue}Instalando o nemo${end}"
sleep 1s
echo $senha | sudo -S pacman -S nemo nemo-preview nemo-share nemo-fileroller --noconfirm
clear

echo -e "$seta ${blue}Instalando compactadores de arquivos${end}"
sleep 1s
echo $senha | sudo -S pacman -S p7zip unrar unzip zip bzip2 --noconfirm
clear

echo -e "$seta ${blue}Instalando pacotes necessários${end}"
sleep 1s
echo $senha | sudo -S pacman -S xorg man-db metacity mtools neofetch bolt gst-libav xdg-utils xdg-user-dirs archlinux-wallpaper system-config-printer dialog youtube-dl xf86-input-synaptics gimp libreoffice libreoffice-fresh-pt-br virtualbox virtualbox-guest-utils bash-completion bluez bluez-cups bluez-tools alsa-utils blueberry  gnome-bluetooth gnome-calculator gnome-calendar archlinux-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnupg gufw ufw accountsservice xreader gnome-disk-utility xfce4-terminal xterm rsync tcpdump colord coreutils cpio ttf-hack neofetch cmatrix system-config-printer gnome-keyring gnome-system-monitor baobab htop lollypop nemo-python  ffmpegthumbnailer --noconfirm
clear

echo -e "$seta ${blue}Instalando o yay${end}"
sleep 1s
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si PKGBUILD --noconfirm
clear

echo -e "$seta ${blue}Instalando cinnamon-sound-effects${end}"
sleep 1s
yay -S cinnamon-sound-effects --noconfirm
clear

echo -e "$seta ${blue}Instalando o xviewer${end}"
sleep 1s
yay -S xviewer xviewer-plugins --noconfirm
clear

echo -e "$seta ${blue}Instalando as fontes${end}"
sleep 1s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "$seta ${blue}Instalando o mint-themes${end}"
sleep 1s
yay -S mint-themes mint-y-icons mint-x-icons mint-backgrounds mintlocale --noconfirm
clear

echo -e "$seta ${blue}Instalando o timeshift${end}"
sleep 1s
yay -S timeshift --noconfirm
clear

echo -e "$seta ${blue}Instalando o xcursor-breeze${end}"
sleep 1s
yay -Ss xcursor-breeze --noconfirm
clear

echo -e "$seta ${blue}Instalando o cinnamon-sound-effects${end}"
sleep 1s
yay -S cinnamon-sound-effects --noconfirm
clear

echo -e "$seta ${blue}Instalando o gnome-online-accounts-git${end}"
sleep 1s
yay -S gnome-online-accounts-git --noconfirm
clear

echo -e "$seta ${blue}Instalando o google-chrome${end}"
sleep 1s
yay -S google-chrome --noconfirm
clear

echo -e "$seta ${blue}Instalando o 4kvideodownloader${end}"
sleep 1s
yay -S 4kvideodownloader --noconfirm
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

echo -e "$seta ${blue}Iniciando o xdg-update${end}"
sleep 1s
if xdg-user-dirs-update; then
    echo "$seta ${green}xdg-update iniciado com sucesso!${end}"
    sleep 2s
else
    echo "$seta ${red}não foi possível iniciar o xdg-update!${end}"
    sleep 2s
    exit 1
clear

#echo -e "$seta ${blue}Instalando e iniciando o lightdm${end}"
#sleep 1s
#echo $senha | sudo -S pacman -S lightdm
#yay -S lightdm lightdm-settings lightdm-slick-greeter
#echo $senha | sudo -Ssudo systemctl enable lightdm 
#clear

echo -e "$seta ${blue}Instalando e iniciando o gdm${end}"
sleep 1s
echo $senha | sudo -S pacman -S gdm
echo $senha | sudo -S sudo systemctl enable gdm
echo $senha | sudo -S sudo systemctl start gdm
clear

