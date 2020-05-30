#!/usr/bin/env bash

# variaveis
pass_user='cp1113bug6u'
mirror='/etc/pacman.d/mirrorlist'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Funções ---------------------------------------------
# Para a maquina virtual
virtual(){
    (echo g; echo n; echo ""; echo ""; echo +512M; echo t; echo 1; echo n; echo ""; echo ""; echo ""; echo w) | fdisk ${disco}
}

# Para o computador
real(){
    (echo d; echo ""; echo d; echo ""; echo g; echo n; echo ""; echo ""; echo +512M; echo t; echo 1; echo n; echo ""; echo ""; echo ""; echo w) | fdisk ${disco}
}

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a instalação do Arch Linux${end}"
sleep 2s
clear

# Definindo layout do teclado
echo -e "${seta} ${blue}Definindo o layout do teclado${end}"
loadkeys br-abnt2
sleep 2s
clear

echo -e "${seta} ${blue}Atualizando o relógio do sistema${end}"
timedatectl set-ntp true
sleep 2s
clear

echo -e "${seta} ${blue}Listando os discos${end}"
lsblk -l | grep disk
sleep 2s
echo ""

echo -en "${seta} ${blue}Informe o nome do seu disco: ${end}"
read disco
disco=/dev/${disco}
clear

# Iniciando particionamento
echo -e "${seta} ${blue}Iniciando particionamento${end}"
sleep 2s
clear

echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para maquina virtual e${end} ${red}[ 2 ]${end} ${blue}para maquina real:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    virtual
    echo -e "${seta} ${blue}Iniciando particionamento na máquina virtual${end}"
    sleep 2s
    clear
elif [ "$resposta" -eq 2 ]; then
    real
    echo -e "${seta} ${blue}Iniciando particionamento na máquina real${end}"
    sleep 2s
    clear
fi

# Formatando partições
echo -e "${seta} ${blue}Formatando as partições${end}"
mkfs.fat -F32 ${disco}1
mkfs.ext4 ${disco}2
sleep 2s
clear

# Montando partições
echo -e "${seta} ${blue}Montando as partições${end}"
mount ${disco}2 /mnt
mkdir -p /mnt/boot/UEFI
mount ${disco}1 /mnt/boot/UEFI
sleep 2s
clear

# Listando partições
echo -e "${seta} ${blue}Conferindo as partições${end}"
lsblk ${disco}
sleep 5s
clear

# Configurando mirrorlist
echo -e "${seta} ${blue}Fazendo backup do mirrorlist${end}"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
clear
echo -e "${seta} ${blue}Comentando todos os servidores${end}"
sleep 2s
sed 's/^Ser/#Ser/' ${mirror} > ${mirror}.bkp
clear
echo -e "${seta} ${blue}Descomentando os servidores Brasileiros${end}"
sleep 2s
sed '/Brazil/{n;s/^#//}' ${mirror}.bkp > ${mirror}
sleep 2s
clear

echo -e "${seta} ${blue}Atualizando os repositórios${end}"
pacman -Syyy --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando os pacotes base${end}"
pacstrap /mnt base base-devel linux linux-firmware
sleep 2s
clear

echo -e "${seta} ${blue}Gerando o fstab${end}"
genfstab -U /mnt >> /mnt/etc/fstab
sleep 2s
clear

echo -e "${seta} ${blue}Copiando o script archinstall-02.sh para /mnt${end}"
cp segunda-parte.sh /mnt
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando arch-chroot${end}"
sleep 2s
arch-chroot /mnt ./segunda-parte.sh

