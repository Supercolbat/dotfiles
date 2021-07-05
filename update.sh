#!/bin/bash

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #
#  This script is only for automating the process of  #
#  uploading my configs to this folder. It is not     #
#  meant for use in installing. Thank you!            #
#                                                     #
#  Feel free to modify this script to your needs if   #
#  you ever plan on using this.                       #
#                                                     #
#  ~ Supercolbat                                      #
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #


# IMPORTANT: Use $HOME instead of ~
# For some reason, bash doesn't it when you use the latter
WorkDir="$HOME/.dotfiles"

# Target files/folders
# Will copy starting from the $HOME folder
# ex: $HOME/.config/rofi
#     $HOME/wallpapers
#     $HOME/.zshrc
Folders=(
    .config/alacritty

    .config/bspwm
    .config/dunst
    .config/nvim
    .config/picom
    .config/polybar
    .config/rofi
    .config/sxhkd
    .oh-my-zsh
    wallpapers
)
Files=(
    .zshrc
    .fehbg
    .p10k.zsh
)

echo "[-] Clearing out repo folders"
for folder in "${Folders[@]}"; do
    if [ -d $WorkDir/$folder ]
    then
        echo "deleting $WorkDir/$folder/*"
        rm -rf $WorkDir/$folder/*  # skip write-protected deletion prompt
    else
        echo "creating $WorkDir/$folder"
        mkdir $WorkDir/$folder
    fi
done

echo

echo "[-] Clearing out repo files"
for file in "${Files[@]}"; do
    if [ -f $WorkDir/$file ]
    then
        echo "deleting $WorkDir/$file"
        rm $WorkDir/$file
    else
        echo "ignoring $WorkDir/$file as it will be created when copying"
    fi
done


echo


echo "[+] Copying folders"
for folder in "${Folders[@]}"; do
    echo "copying $HOME/$folder to $WorkDir/$folder"
    cp -r $HOME/$folder/* $WorkDir/$folder
done

echo

echo "[+] Copying files"
for file in "${Files[@]}"; do
    echo "copying $HOME/$file to $WorkDir/$file"
    cp $HOME/$file $WorkDir/$file
done
