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

# Configurando mirrorlist
echo -e "$seta ${blue}Fazendo backup do mirrorlist${end}"
sleep 1s
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
clear
echo -e "${seta} ${blue}Comentando todos os servidores"
sleep 1s
sed 's/^Ser/#Ser/' ${mirror} > ${mirror}.bkp
clear
echo -e "${seta} ${blue}Descomentando os servidores Brasileiros${end}"
sleep 1s
sed '/Brazil/{n;s/^#//}' ${mirror}.bkp > ${mirror}
clear

echo -e "${seta} ${blue}Atualizando os repositórios${end}"
sleep 1s
echo $senha | sudo -S pacman -Syyy
clear

# Drivers de video
echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
sleep 1s
echo $senha | sudo -S pacman -S xf86-video-intel --noconfirm
clear

echo -e "$seta ${blue}Instalando o cinnamon desktop${end}"
sleep 1s
echo $senha | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-common cinnamon-control-center cinnamon-control-center-data cinnamon-control-center-dbg cinnamon-dbg cinnamon-desktop-data cinnamon-l10n cinnamon-screensaver cinnamon-session cinnamon-session-common cinnamon-settings-daemon --noconfirm
clear

echo -e "$seta ${blue}Instalando alguns pacotes${end}"
sleep 1s
clear
echo $senha | sudo -S pacman -S xorg gdm nemo nemo-share nemo-fileroller gst-libav xdg-utils xdg-user-dirs archlinux-wallpaper system-config-printer dialog youtube-dl xf86-input-synaptics gimp libreoffice libreoffice-fresh-pt-br virtualbox virtualbox-guest-utils bash-completionbluez bluez-cups bluez-obexd bluez-tools vim git wget adobe-flashplugin alsa-utils blueberry bluetooth bzip2 dmz-cursor-theme eject gnome-bluetooth gnome-calculator gnome-calendar gnome-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnupg ufw adwaita-icon-theme accountsservice intel-ucode xreader gnome-disk-utility --noconfirm

echo -e "$seta ${blue}Iniciando o gdm${end}"
sleep 1s
echo $senha | sudo -S sudo systemctl start gdm
echo $senha | sudo -S sudo systemctl enable gdm
clear

echo -e "$seta ${blue}Instalando temas linux-mint{end}"
sleep 1s
echo $senha | sudo -S sudo systemctl enable bluetooth && sudo systemctl start bluetooth
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
clear

echo -e "$seta ${blue}Uma interface para configurar GDM3${end}"
sleep 1s
yay -S gdm3setup-utils --noconfirm
clear

echo -e "$seta ${blue}Instalando as fontes${end}"
sleep 1s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "$seta ${blue}Instalando o mint-themes${end}"
sleep 1s
yay -S mint-themes mint-y-icons mint-x-icons --noconfirm
clear

echo -e "$seta ${blue}Instalando google-chrome${end}"
sleep 1s
yay -S google-chrome --noconfirm
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
