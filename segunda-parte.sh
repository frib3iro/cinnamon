#!/usr/bin/env bash

# variaveis e password root/user
user='fabio'
pass_user='cp1113bug6u'
pass_root='cp1211rmcc3'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

clear
echo -e "${seta} ${blue}Bem vido a segunda parte da instalação!${end}"
sleep 2s
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Criando o arquivo de swap${end}"
sleep 2s
fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile none swap defaults 0 0 >> /etc/fstab 
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Ajustando o fuso horário${end}"
sleep 2s
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Executando hwclock${end}"
sleep 2s
hwclock --systohc --utc
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Editando locale.gen
echo -e "${seta} ${blue}Definir o idioma do ambiente live${end}"
sleep 2s
sed -i 's/en_US ISO-8859-1/#en_US ISO-8859-1/' /etc/locale.gen
sed -i 's/en_US.UTF-8/#en_US.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR.UTF-8/pt_BR.UTF-8/' /etc/locale.gen
sed -i 's/#pt_BR ISO-8859-1/pt_BR ISO-8859-1/' /etc/locale.gen
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Gerando locale-gen${end}"
sleep 2s
locale-gen
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Criando arquivo locale.conf${end}"
sleep 2s
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Exportando a variável LANG${end}"
sleep 2s
export LANG=pt_BR.UTF-8
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Criando o arquivo vconsole.conf${end}"
sleep 2s
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Criando o arquivo hostname${end}"
sleep 2s
echo archlinux > /etc/hostname
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Configurando hosts
echo -e "${seta} ${blue}Configurando o arquivo hosts${end}"
sleep 2s
cat >> '/etc/hosts' << EOF
127.0.0.1   localhost.localdomain   localhost
::1         localhost.localdomain   localhost
127.0.1.1   archlinux.localdomain   archlinux
EOF
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Criando senha de root
echo -e "${seta} ${blue}Criando a senha do root${end}"
sleep 2s
echo "root:$pass_root" | chpasswd
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Baixando o Gerenciador de boot e mais alguns pacotes${end}"
sleep 2s
clear

echo -en "${seta} ${blue}Digite o nome dos pacotes que deseja baixar: ${end}"
read pacotes
# pacman -S $pacotes --noconfirm
pacman -S grub efibootmgr networkmanager network-manager-applet dosfstools linux-headers vim git --noconfirm
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Instalando o GRUB${end}"
sleep 2s
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Configurando o grub${end}"
sleep 2s
grub-mkconfig -o /boot/grub/grub.cfg
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Iniciando NetworkManager${end}"
sleep 2s
systemctl enable NetworkManager
systemctl start NetworkManager
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Adicionando um usuario
echo -e "${seta} ${blue}Adicionando um usuário${end}"
sleep 2s
useradd -m -g users -G wheel fabio
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Criando senha de usuario
echo -e "${seta} ${blue}Adicionando uma senha para o usuário${end}"
sleep 2s
echo "$user:$pass_user" | chpasswd 
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

# Adicionando user no grupo sudoers
echo -e "${seta} ${blue}Adicionando $user no grupo sudoers${end}"
sleep 2s
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
clear

echo -e "${seta} ${blue}Reinicie o sistema para continuar com a terceira parte!${end}"
sleep 2s
echo -e "${seta} ${yellow}Aperte enter para continuar${end}"
read
exit 

