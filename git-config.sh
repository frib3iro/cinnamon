#!/bin/bash

# variaveis
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'
texto="Script para instalação do Arch Linux"

echo -en "$seta ${blue}Deseja configurar o git${end} ${red}<s/n>${end}${blue}?${end} "
read resposta
clear

if [[ "$resposta" == @(S|s) ]]; then
    echo -e "$seta ${blue}Iniciando a configuração do git.${end}"
    sleep 3s
    clear

    echo -e "$seta ${blue}Configurando nome de usuário.${end}"
    sleep 3s
    git config --global user.name Fabio Ribeiro
    clear

    echo -e "$seta ${blue}Configurando email.${end}"
    sleep 3s
    git config --global user.email rib3iro@live.com
    clear

    echo -e "$seta ${blue}Configurando editor padrão.${end}"
    sleep 3s
    git config --global core.editor vim 
    clear

    echo -e "$seta ${blue}Configurando o vimdiff.${end}"
    git config --global core.editor vimdiff
    sleep 3s
    clear

    echo -e "$seta ${blue}Listando a configuração do git.${end}"
    sleep 3s
    git config --list
    sleep 5s
    clear
else
    echo -e "$seta ${blue}Adicionando arquivos.${end}"
    sleep 3s
    git add *
    clear

    echo -e "$seta ${blue}Verificando o status.${end}"
    sleep 3s
    git status
    sleep 5s
    clear

    echo -e "$seta ${blue}Fazendo o commit.${end}"
    sleep 3s
    # echo -en "$seta ${blue}Digite o texto do commit:${end} "
    git commit -m "$texto"
    clear

    echo -e "$seta ${blue}Fazendo o push.${end}"
    sleep 3s
    git push origin master
    clear
fi


