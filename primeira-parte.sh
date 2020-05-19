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

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a instalação do Arch Linux${end}"
sleep 1s
clear

# Definindo layout do teclado
echo -e "${seta} ${blue}Definir o layout do teclado${end}"
sleep 1s
loadkeys br-abnt2
clear

# Definir o idioma do ambiente live
echo -e "${seta} ${blue}Definir o idioma do ambiente live${end}"
sleep 1s
sed -i 's/en_US ISO-8859-1/#en_US ISO-8859-1/' /etc/locale.gen
sed -i 's/en_US.UTF-8/#en_US.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR.UTF-8/pt_BR.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR ISO-8859-1/pt_BR ISO-8859-1/' /etc/locale.gen
clear

echo -e "${seta} ${blue}Gerando locale-gen${end}"
sleep 1s
locale-gen
clear

echo -e "${seta} ${blue}Exportando a variável LANG${end}"
sleep 1s
export LANG=pt_BR.UTF-8
clear

echo -e "${seta} ${blue}Atualizando o relógio do sistema${end}"
sleep 1s
timedatectl set-ntp true
clear

echo -e "${seta} ${blue}Listando os discos${end}"
sleep 1s
lsblk -l | grep disk
echo ""

echo -en "${seta} ${blue}Informe o nome do seu disco: ${end}"
sleep 1s
read disco
disco=/dev/${disco}
clear

# Iniciando particionamento
echo -e "${seta} ${blue}Iniciando particionamento${end}"
sleep 2s
(echo d; echo ""; echo d; echo ""; echo g; echo n; echo ""; echo ""; echo +512MB; echo t; echo 1; echo n; echo ""; echo ""; echo ""; echo w) | fdisk ${disco}
clear

# Formatando partições
echo -e "${seta} ${blue}Formatando as partições${end}"
sleep 1s
mkfs.fat -F32 ${disco}1
mkfs.ext4 ${disco}2
clear

# Montando partições
echo -e "${seta} ${blue}Montando as partições${end}"
sleep 1s
mount ${disco}2 /mnt
mkdir -p /mnt/boot/EFI
mount ${disco}1 /mnt/boot/EFI
clear

# Listando partições
echo -e "${seta} ${blue}Conferindo as partições${end}"
sleep 1s
lsblk ${disco}
sleep 5s
clear

# Configurando mirrorlist
echo -e "${seta} ${blue}Fazendo backup do mirrorlist${end}"
sleep 1s
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
clear
echo -e "${seta} ${blue}Comentando todos os servidores${end}"
sleep 1s
sed 's/^Ser/#Ser/' ${mirror} > ${mirror}.bkp
clear
echo -e "${seta} ${blue}Descomentando os servidores Brasileiros${end}"
sleep 1s
sed '/Brazil/{n;s/^#//}' ${mirror}.bkp > ${mirror}
clear

echo -e "${seta} ${blue}Atualizando os repositórios${end}"
sleep 1s
pacman -Syyy
clear

echo -e "${seta} ${blue}Instalar os pacotes base${end}"
sleep 1s
pacstrap /mnt base base-devel linux linux-firmware
clear

echo -e "${seta} ${blue}Gerando o fstab${end}"
sleep 1s
genfstab -U /mnt >> /mnt/etc/fstab
clear

echo -e "${seta} ${blue}Copiando o script archinstall-02.sh para /mnt${end}"
sleep 1s
cp segunda-parte.sh /mnt
clear

echo -e "${seta} ${blue}Iniciando arch-chroot${end}"
sleep 1s
arch-chroot /mnt ./segunda-parte.sh

