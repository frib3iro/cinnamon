#!/usr/bin/env bash

# variaveis
senha='cp1113bug6u'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Funções ------------------------------------------------------------
driver_virtmanager(){
    echo $senha | sudo -S pacman -S xf86-video-qxl --noconfirm
}

driver_nvidia(){
    echo $senha | sudo -S pacman -S nvidia nvidia-utils nvidia-settings intel-ucode --noconfirm
}
# GDM ----------------------------------------------------------------
instalar_gdm(){
    echo $senha | sudo -S pacman -S gdm --noconfirm
}
iniciar_gdm(){
    echo $senha | sudo -S systemctl enable gdm
    echo $senha | sudo -S systemctl start gdm
}

# Lightdm ------------------------------------------------------------
instalar_lightdm(){
    echo $senha | sudo -S pacman -S lightdm --noconfirm
}

unity_greeter(){
    yay -S lightdm-unity-greeter --noconfirm
}

gtk_greeter_settings(){
    echo $senha | sudo -S pacman -S lightdm-gtk-greeter-settings --noconfirm
}

configurar_lightdm(){
    sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
}

iniciar_lightdm(){
     echo $senha | sudo -S systemctl enable lightdm.service
     echo $senha | sudo -S systemctl start lightdm.service
}
# -------------------------------------------------------------------

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando...${end}"
echo $senha | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver virt-manager ou${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    driver_virtmanager
    sleep 2s
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    driver_nvidia
    sleep 2s
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "${seta} ${blue}Instalando o cinnamon desktop${end}"
echo $senha | sudo -S pacman -S cinnamon cinnamon-translations cinnamon-screensaver cinnamon-session cinnamon-settings-daemon --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o nemo${end}"
echo $senha | sudo -S pacman -S nemo nemo-preview nemo-share nemo-fileroller --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando pacotes necessários${end}"
echo $senha | sudo -S pacman -S accountsservice alsa-utils archlinux-keyring archlinux-wallpaper baobab bash-completion blueberry bluez bluez-cups bluez-tools bolt cmatrix colord coreutils cpio cronie dialog ffmpegthumbnailer gimp gnome-bluetooth gedit gnome-calculator gnome-calendar gnome-disk-utility gnome-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnome-system-monitor gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lollypop man-db metacity mtools neofetch pass rsync system-config-printer tcpdump totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip xfce4-terminal xreader youtube-dl --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o virt-manager${end}"
echo $senha | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils edk2-ovmf spice-vdagent --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o daemon libvirt${end}"
echo $senha | sudo -S systemctl enable libvirtd.service
echo $senha | sudo -S systemctl start libvirtd.service
sleep 2s
clear

echo -e "${seta} ${blue}Inserindo o $USER no grupo libvirt${end}"
echo $senha | sudo -S usermod -aG libvirt $USER
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando a rede virt-manager automáticamente${end}"
echo $senha | sudo -S virsh net-autostart --network default
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
sleep 2s
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${blue}Instalando aircrack-ng e usbutils${end}"
echo $senha | sudo -S pacman -S aircrack-ng usbutils --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o crunch${end}"
yay -S --noconfirm crunch
sleep 2s
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${blue}Instalando o kid3-cli para o lollypop${end}"
yay -S --noconfirm kid3-cli
sleep 2s
clear

echo -e "${seta} ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
yay -S --noconfirm aic94xx-firmware wd719x-firmware
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o debtap${end}"
yay -S --noconfirm debtap
sleep 2s
clear

echo -e "${seta} ${blue}Instalando cinnamon-sound-effects${end}"
yay -S --noconfirm cinnamon-sound-effects
sleep 2s
clear

echo -e "${seta} ${blue}Instalando spotify${end}"
yay -S --noconfirm spotify
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o xviewer${end}"
yay -S --noconfirm xviewer xviewer-plugins
sleep 2s
clear

echo -e "${seta} ${blue}Instalando as fontes${end}"
yay -S --noconfirm ttf-ms-fonts
yay -S --noconfirm ttf-ubuntu-font-family
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o mint-themes${end}"
yay -S --noconfirm mint-themes mint-y-icons mintlocale
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o gnome-online-accounts-git${end}"
yay -S --noconfirm gnome-online-accounts-git
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o google-chrome${end}"
yay -S --noconfirm google-chrome
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o xdg-update${end}"
sleep 2s
if xdg-user-dirs-update; then
    echo -e "${seta} ${green}xdg-update iniciado com sucesso!${end}"
    sleep 2s
    clear
else
    echo -e "${seta} ${red}não foi possível iniciar o xdg-update!${end}"
    sleep 2s
    clear
    continue 
fi

echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o gdm ou ${end} ${red}[ 2 ]${end} ${blue}para instalar o lightdm${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Instalando e iniciando o gdm${end}"
    instalar_gdm 
    sleep 2s
    clear

    echo -e "${seta} ${blue}Iniciando o serviço do gdm${end}"
    iniciar_gdm
    sleep 2s
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Instalando o lightdm${end}"
    instalar_lightdm
    sleep 2s
    clear

    echo -e "${seta} ${blue}Instalando o lightdm-unity-greeter${end}"
    unity_greeter
    sleep 2s
    clear

    echo -e "${seta} ${blue}Instalando o gtk_greeter_settings${end}"
    gtk_greeter_settings
    sleep 2s
    clear
    
    echo -e "${seta} ${blue}Configurando o lightdm${end}"
    configurar_lightdm
    echo
    echo -e "${seta} ${yellow}Aperte enter para continuar...${end}"
    read
    clear

    echo -e "${seta} ${blue}Iniciando o serviço do lightdm${end}"
    iniciar_lightdm
    sleep 2s
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi
