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

# variaveis
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

clear
# Menu -----------------------------------------------------------------
menu(){
    echo -e "${seta} ${green}[ 1 ]${end} ${blue}Configurar o git localmente${end}"
    echo -e "${seta} ${green}[ 2 ]${end} ${blue}Adicionar arquivos no repositório github${end}"
    echo -e "${seta} ${green}[ 3 ]${end} ${blue}Criar um novo repositório a partir da linha de comando${end}"
    echo -e "${seta} ${green}[ 4 ]${end} ${blue}Enviar um repositório existente a partir da linha de comando${end}"

    echo
    echo -en "${seta} ${blue}Digite a opção desejada:${end} "
    read opcao
    clear
    case $opcao in
        1) configurar ;;
        2) adicionar ;;
        3) criar_repositorio ;;
        4) enviar_repositorio ;;
        *) echo -e "${seta} ${red}Opcao inválida!${end}"; exit 1 > /dev/null ;;
    esac
}

# Funções ------------------------------------------------------------
repositorio(){
    echo -en "${seta} ${blue}Informe o nome do repositório:${end} "
    read repositorio
    cd ~/github/$repositorio
    clear
}

configurar(){
    echo -e "${seta} ${blue}Configurando nome de usuário${end}"
    sleep 2s
    git config --global user.name Fabio Ribeiro
    clear

    echo -e "${seta} ${blue}Configurando email${end}"
    sleep 2s
    git config --global user.email rib3iro@live.com
    clear

    echo -e "${seta} ${blue}Configurando editor padrão${end}"
    sleep 2s
    git config --global core.editor vim
    clear

    echo -e "${seta} ${blue}Configurando o vimdiff${end}"
    sleep 2s
    git config --global core.editor vimdiff
    clear

    echo -e "${seta} ${blue}Listando a configuração do git${end}"
    sleep 2s
    git config --list
    clear
}

adicionar(){
    echo -e "${seta} ${blue}Adicionando arquivos${end}"
    sleep 2s
    git add *
    clear

    echo -e "${seta} ${blue}Verificando o status${end}"
    sleep 2s
    git status
    clear

    echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para digitar o texto ou${end} ${red}[ 2 ]${end} ${blue}para usar o texto padrão:${end} "
    read resposta
    clear

    if [ "$resposta" -eq 1 ]; then
        echo -en "${seta} ${blue}Digite o texto do seu commit:${end} "
        read texto
        git commit -m "${texto}" 
        clear
    elif [ "$resposta" -eq 2 ]; then
        echo -e "${seta} ${blue}Utilizando commit básico...${end}"
        git commit -m "Utilizando commit básico"
        sleep 2s
        clear
    fi

    echo -e "${seta} ${blue}Fazendo o push${end}"
    git push origin master
    sleep 2s
    clear
}

criar_repositorio(){
    echo -en "${seta} ${blue}Digite o nome do novo repositório:${end} "
    read novo_repositorio
    echo "# ${repositorio}" >> README.md
    git init
    git add *
    git commit -m "Primeiro commit"
    git remote add origin https://github.com/frib3iro/${repositorio}.git
    git push -u origin master
}

enviar_repositorio(){
    echo -en "${seta} ${blue}Digite o nome do novo repositório:${end} "
    read novo_repositorio
    git remote add origin https://github.com/frib3iro/${repositorio}.git
    git push -u origin master
}

# Programa -----------------------------------------------------------
echo -en "${seta} ${blue}Iniciando configuração do git e github${end}"
sleep 2s
clear
repositorio
echo -e "${seta} ${blue}Listando o diretório atual${end}"
pwd
echo
clear
menu

