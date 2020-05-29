#!/bin/bash
#----------------------------------------------------------------------
# Script    : gitconfig
# Descrição : Script para configuração rápida do git
# Versão    : 0.1
# Autor     : Fabio Junior Ribeiro <rib3iro@live.com>
# Data      : 28/05/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       :
#----------------------------------------------------------------------

# variaveis -----------------------------------------------------------
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

clear
# Menu -----------------------------------------------------------------
menu(){
    echo -e "${seta} ${green}[ 1 ]${end} ${blue}Configurar o git localmente${end}"
    echo -e "${seta} ${green}[ 2 ]${end} ${blue}Adicionar arquivos no repositório github${end}"
    echo
    echo -en "${seta} ${blue}Digite a opção desejada:${end} "
    read opcao
    clear
    case $opcao in
        1) configurar ;;
        2) adicionar ;;
        *) echo -e "${seta} ${red}Opcao inválida!${end}"; exit 1 > /dev/null ;;
    esac
}

# Funções ------------------------------------------------------------
configurar(){
    echo -en "${seta} ${blue}Informe o nome do repositório:${end} "
    read repositorio
    cd ~/github/$repositorio
    clear

    echo -e "${seta} ${blue}Configurando nome de usuário${end}"
    git config --global user.name Fabio Ribeiro
    sleep 2s
    clear

    echo -e "${seta} ${blue}Configurando email${end}"
    git config --global user.email rib3iro@live.com
    sleep 2s
    clear

    echo -e "${seta} ${blue}Configurando editor padrão${end}"
    git config --global core.editor vim
    sleep 2s
    clear

    echo -e "${seta} ${blue}Configurando o vimdiff${end}"
    git config --global core.editor vimdiff
    sleep 2s
    clear

    echo -e "${seta} ${blue}Listando a configuração do git${end}"
    git config --list
    sleep 2s
    clear
}

adicionar(){
    echo -e "${seta} ${blue}Adicionando arquivos${end}"
    git add *
    sleep 2s
    clear

    echo -e "${seta} ${blue}Verificando o status${end}"
    git status
    sleep 2s
    clear

    echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para digitar o texto ou${end} ${red}[ 2 ]${end} ${blue}para usar o texto padrão:${end} "
    read resposta
    clear

    if [ "$resposta" -eq 1 ]; then
        echo -en "${seta} ${blue}Digite o texto do seu commit:${end} "
        read texto
        git commit -m "${texto}" 
        sleep 2s
        clear
    elif [ "$resposta" -eq 2 ]; then
        echo -e "${seta} ${blue}Utilizando commit básico...${end}"
        git commit -m "Commit básico"
        sleep 2s
        clear
    fi

    echo -e "${seta} ${blue}Fazendo o push${end}"
    git push origin master
    sleep 2s
    clear
}

# Programa -----------------------------------------------------------
echo -en "${seta} ${blue}Iniciando configuração do git e github${end}"
sleep 2s
clear
menu


