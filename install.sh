#!/bin/bash
sudo pacman -S vim --noconfirm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pacman -S nodejs npm --noconfirm
sudo pacman -S ctags --noconfirm
#mv ./vimrc ~/.vimrc
cp ./vimrc ~/.vimrc

SCRIPT_PATH="$(realpath "$0")"
PARENT_DIR="$(dirname "$SCRIPT_PATH")"

read -p "Вaм ещё нужен установщик настроек и зависимастей для Vim? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Удаление..."
    rm -f -- "$SCRIPT_PATH"  # Сначала удаляем скрипт
    rmdir --ignore-fail-on-non-empty "$PARENT_DIR" 2>/dev/null || {
        echo "Папка не пуста. Удаляем рекурсивно..."
        rm -rf -- "$PARENT_DIR"
    }
    echo "Готово! Скрипт и папка удалены."
else
    echo "Отмена. Ничего не удалено."
fi
