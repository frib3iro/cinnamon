#!/bin/bash

# variaveis
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'
texto="Script para instalação do Arch Linux"

echo -en "$seta ${blue}Deseja configurar o git${end} ${red}[s/n]${end}${blue}? ${end}"
read resposta
clear

if [[ "$resposta" == @(S|s) ]]; then
    echo -e "$seta ${blue}Iniciando a configuração do git.${end}"
    sleep 1s
    clear

    echo -e "$seta ${blue}Configurando nome de usuário.${end}"
    git config --global user.name Fabio Ribeiro
    sleep 1s
    clear

    echo -e "$seta ${blue}Configurando email.${end}"
    git config --global user.email rib3iro@live.com
    sleep 1s
    clear

    echo -e "$seta ${blue}Configurando editor padrão.${end}"
    git config --global core.editor vim 
    sleep 1s
    clear

    echo -e "$seta ${blue}Configurando o vimdiff.${end}"
    git config --global core.editor vimdiff
    sleep 1s
    clear

    echo -e "$seta ${blue}Listando a configuração do git.${end}"
    git config --list
    sleep 3s
    clear
else
    echo -e "$seta ${blue}Adicionando arquivos.${end}"
    git add *
    sleep 1s
    clear

    echo -e "$seta ${blue}Verificando o status.${end}"
    git status
    sleep 3s
    clear

    echo -e "$seta ${blue}Fazendo o commit.${end}"
    # echo -en "$seta ${blue}Digite o texto do commit:${end} "
    git commit -m "$texto"
    sleep 1s
    clear

    echo -e "$seta ${blue}Fazendo o push.${end}"
    git push origin master
fi


