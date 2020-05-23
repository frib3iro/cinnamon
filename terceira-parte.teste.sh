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
echo $senha | sudo -S pacman -Syyy
sleep 2s
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
echo $senha | sudo -S pacman -S xf86-video-intel intel-ucode --noconfirm
sleep 2s
clear

### Ambientes desktop
deepin(){
    echo -e "$seta ${blue}Instalando o deepin desktop${end}"
    echo $senha | sudo -S pacman -S deepin --noconfirm
    sleep 2s
    clear

    echo -e "$seta ${blue}Instalando o deepin-extra${end}"
    echo $senha | sudo -S pacman -S deepin-extra --noconfirm
    sleep 2s
    clear
}

cinnamon(){
    echo -e "$seta ${blue}Instalando o cinnamon desktop${end}"
    echo $senha | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-screensaver cinnamon-session cinnamon-settings-daemon --noconfirm
    sleep 2s
    clear
}

### Gerenciadores de login
lightdm(){
    echo -e "$seta ${blue}Instalando e iniciando o lightdm${end}"
    sleep 2s
    echo $senha | sudo -S pacman -S lightdm --noconfirm
    yay -S lightdm-settings lightdm-gtk-greeter
    yay -S lightdm-settings lightdm-gtk-greeter-settings
    echo $senha | sudo -S systemctl enable lightdm.service
    echo $senha | sudo -S systemctl start lightdm.service
    clear
}

gdm(){
    echo -e "$seta ${blue}Instalando e iniciando o gdm${end}"
    sleep 2s
    echo $senha | sudo -S pacman -S gdm --noconfirm
    echo $senha | sudo -S systemctl enable gdm
    echo $senha | sudo -S systemctl start gdm
    clear
}

### Gerenciadores de arquivos
nemo(){
    echo -e "$seta ${blue}Instalando o nemo${end}"
    echo $senha | sudo -S pacman -S nemo nemo-preview nemo-share nemo-fileroller --noconfirm
    sleep 2s
    clear
}

nautilus(){
    echo -e "$seta ${blue}Instalando o nautilus${end}"
    echo $senha | sudo -S pacman -S nautilus --noconfirm
    sleep 2s
    clear
}
#-----------------------------------------------------------------------------------------------------------------------

echo -e "$seta ${blue}Instalando compactadores de arquivos${end}"
echo $senha | sudo -S pacman -S p7zip unrar unzip zip bzip2 --noconfirm
sleep 2s
echo -e "$seta ${yellow}Aperdte enter para continuar...${end}"
read
sleep 2s
clear

echo -e "$seta ${blue}Instalando pacotes necessários${end}"
echo $senha | sudo -S pacman -S xorg man-db metacity mtools neofetch bolt gst-libav xdg-utils xdg-user-dirs archlinux-wallpaper system-config-printer dialog youtube-dl xf86-input-synaptics gimp libreoffice libreoffice-fresh-pt-br virtualbox virtualbox-guest-utils bash-completion bluez bluez-cups bluez-tools alsa-utils blueberry  gnome-bluetooth gnome-calculator gnome-calendar archlinux-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnupg gufw ufw accountsservice xreader gnome-disk-utility xfce4-terminal xterm rsync tcpdump colord coreutils cpio ttf-hack neofetch cmatrix system-config-printer gnome-keyring gnome-system-monitor baobab htop lollypop nemo-python ffmpegthumbnailer --noconfirm
sleep 2s
clear

echo -en "${seta}${blue}Escolha seu ambiente gráfico${end}"

read resposta

case $resposta in
    1) cinnamon ;;
    2) deepin   ;;
    3) gnome    ;;
esac

echo -e "$seta ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si PKGBUILD --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando gnome-terminal-transparency${end}"
yay -Ss gnome-terminal-transparency --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando cinnamon-sound-effects${end}"
yay -S cinnamon-sound-effects --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando spotify${end}"
yay -S spotify --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o xviewer${end}"
yay -S xviewer xviewer-plugins --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando as fontes${end}"
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o mint-themes${end}"
yay -S mint-themes mint-y-icons mint-x-icons mint-backgrounds mintlocale --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o timeshift${end}"
yay -S timeshift --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o xcursor-breeze${end}"
yay -Ss xcursor-breeze --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o gnome-online-accounts-git${end}"
yay -S gnome-online-accounts-git --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o google-chrome${end}"
yay -S google-chrome --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o 4kvideodownloader${end}"
yay -S 4kvideodownloader --noconfirm
sleep 2s
clear

# echo -e "${seta} ${blue}Definindo o layout do teclado no ambiente cinnamon${end}"
# sleep 2s
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

# echo -e "$seta ${blue}Instalando e iniciando o lightdm${end}"
# echo $senha | sudo -S pacman -S lightdm --noconfirm
# yay -S lightdm-settings lightdm-slick-greeter
# echo $senha | sudo -S systemctl enable lightdm 
# echo $senha | sudo -S systemctl start lightdm 
# sleep 2s
# clear


