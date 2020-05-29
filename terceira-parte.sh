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
    # Drivers de video para virt-manager
    echo -e "$seta ${blue}Instalando os drivers de vídeo${end}"
    echo $senha | sudo -S pacman -S xf86-video-qxl --noconfirm
    sleep 2s
    clear
}

driver_nvidia(){
    # Drivers de video nvidia
    echo -e "$seta ${blue}Instalando os drivers de vídeo nvidia${end}"
    echo $senha | sudo -S pacman -S nvidia nvidia-utils nvidia-settings intel-ucode --noconfirm
    sleep 2s
    clear
}

instalar_lightdm(){
    echo $senha | sudo -S pacman -S lightdm
}

deepin_greeter(){
    yay -S lightdm-deepin-greeter
}

gtk_greeter(){
    echo $senha | sudo -S pacman -S lightdm-gtk-greeter-settings
}

arquivo_de_configuracao(){
    sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-slick-greeter/' /etc/lightdm/lightdm.conf
}

iniciar_testmode(){
    lightdm --test-mode --debug
}

iniciar_servico(){
    systemctl start lightdm.service && systemctl enable lightdm.service
}
# --------------------------------------------------------------------

# Tela de boas vindas
clear
echo -e "$seta ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando os repositórios${end}"
echo $senha | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver para o virt-manager ou${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    virtmanager
    sleep 2s
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    nvidia
    sleep 2s
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "$seta ${blue}Instalando o deepin desktop${end}"
echo $senha | sudo -S pacman -S deepin deepin-extra --noconfirm
sleep 2s
clear

echo -e "$seta ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
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

echo -e "$seta ${blue}Instalando o xviewer${end}"
yay -S --noconfirm xviewer xviewer-plugins
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

echo -e "${seta} ${blue}Instalando o lightdm${end}"
instalar_lightdm
sleep 2s
clear


echo -e "${seta} ${blue}Instalando o lightdm-deepin-greeter${end}"
deepin_greeter
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o lightdm-gtk-greeter${end}"
gtk_greeter
sleep 2s
clear

echo -e "${seta} ${blue}Configurando o lightdm lightdm.conf${end}"
arquivo_de_configuracao
sleep 2s
clear

echo -e "${seta} ${blue}Testando o lightdm com o testmode${end}"
iniciar_testmode
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o serviço do lightdm${end}"
iniciar_servico
sleep 2s
clear
