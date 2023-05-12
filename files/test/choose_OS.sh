#!/bin/sh
echo -e "\033[31mПроверка вашего Интернет подключения\033[0m"
wget -q --spider http://google.com
if [ $? -eq 0 ]; then
    echo "1) Debian(Ubuntu, Mint, ZorinOS, ElementaryOS)"
    echo "2) Arch (Manjaro)"
    echo "3) Fedora"
    echo "4) Slackware"
    echo "5) Gentoo"
    echo -n "Введите номер вашей ОС:  "
    read choose_OS
    case $choose_OS in
        1)
            sudo apt -y update && sudo apt -y install zenity gcc
            ;;
        2)
            yes | sudo pacman -Sy zenity gcc
            ;;
        3)
            sudo dnf -y update && sudo dnf -y install zenity gcc
            ;;
        4)
            sudo installpkg zenity && sudo installpkg gcc
            ;;
        5)
            sudo emerge sync && sudo emerge zenity && sudo emerge gcc
            ;;
    esac
    ./start
else
    echo -e "\033[31mУ вас не подключена сеть\033[0m"
fi