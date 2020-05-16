#!/usr/bin/env bash

# Para ver somente os comandos da instalação digite o comando abaixo
# 'grep -i '#' install.txt'

# variaveis
senha=cp1113bug6u
mirror='/etc/pacman.d/mirrorlist'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

clear
echo -e "$seta ${blue}Bem vindo a instalação do Arch Linux${end}"
sleep 2s
clear

echo -e "$seta ${blue}Definir o layout do teclado${end}"
sleep 2s
loadkeys br-abnt2
setfont lat0–16
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# Definir o idioma do ambiente live
echo -e "$seta ${blue}Definir o idioma do ambiente live${end}"
sleep 2s
sed -i 's/en_US ISO-8859-1/#en_US ISO-8859-1/' /etc/locale.gen
sed -i 's/en_US.UTF-8/#en_US.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR.UTF-8/pt_BR.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR ISO-8859-1/pt_BR ISO-8859-1/' /etc/locale.gen
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Gerando locale-gen${end}"
sleep 2s
locale-gen
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Exportando a variável LANG${end}"
sleep 2s
export LANG=pt_BR.UTF-8
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Atualizar o relógio do sistema${end}"
sleep 2s
timedatectl set-ntp true
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Testando a internet${end}"
sleep 2s
ping -c 4 archlinux.org 
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Listando os discos${end}"
sleep 2s
lsblk -l | grep disk
echo ""

echo -en "$seta ${blue}Informe o nome do seu disco: ${end}"
read disco
disco=/dev/${disco}
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# echo -e "$seta ${blue}Apagando o disco completamente${end}"
# sleep 2
# sgdisk --zap-all ${disco}
# clear

# Iniciando particionamento
echo -e "$seta ${blue}Iniciando particionamento${end}"
sleep 2s
(echo d; echo ""; echo d; echo ""; echo g; echo n; echo ""; echo ""; echo +512MB; echo t; echo 1; echo n; echo ""; echo ""; echo ""; echo w) | fdisk ${disco}
# fdisk ${disco}
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# Formatando partições
echo -e "$seta ${blue}Formatando as partições${end}"
sleep 2s
mkfs.fat -F32 ${disco}1
mkfs.ext4 ${disco}2
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# Montando partições
echo -e "$seta ${blue}Montando as partições${end}"
sleep 2s
mount ${disco}2 /mnt
mkdir -p /mnt/boot/EFI
mount ${disco}1 /mnt/boot/EFI
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# Listando partições
echo -e "$seta ${blue}Conferindo as partições${end}"
sleep 2s
lsblk ${disco}
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

# Configurando mirrorlist
echo -e "$seta ${blue}Instalando reflector${end}"
sleep 2s
pacman -Syy reflector
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Fazendo backup do mirrorlist${end}"
sleep 2s
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Selecionando os espelhos mais rápidos${end}"
reflector -c Brazil -a  6 --sort rate --save /etc/pacman.d/mirrorlist
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Atualizando os repositórios${end}"
sleep 2s
pacman -Syyy
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Instalar os pacotes base${end}"
sleep 2s
pacstrap /mnt base base-devel linux linux-firmware 
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Gerando o fstab${end}"
sleep 2s
genfstab -U /mnt >> /mnt/etc/fstab
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Copiando o script archinstall-02.sh para /mnt${end}"
sleep 2s
cp segunda-parte.sh /mnt
echo -e "$seta ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "$seta ${blue}Iniciando arch-chroot${end}"
sleep 2s
arch-chroot /mnt ./segunda-parte.sh
