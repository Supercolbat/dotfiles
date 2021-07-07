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


# I renamed the folder from 'dotfiles' to '.dotfiles'
WorkDir=~/.dotfiles

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
    .config/mpd
    .config/ncmpcpp
    .oh-my-zsh
    .doom.d
    .emacs.d
    wallpapers
)
Files=(
    .zshrc
    .fehbg
    .p10k.zsh
)

echo "[-] Clearing out repo folders"
for folder in ${Folders[@]}; do
    if [ -d $WorkDir/$folder ]
    then
        echo "deleting $WorkDir/$folder/*"
        # reason for -f: skip write-protected deletion prompt
        #                from files in .git folders
        rm -rf $WorkDir/$folder/*
    else
        echo "creating $WorkDir/$folder"
        mkdir $WorkDir/$folder
    fi
done

echo

echo "[-] Clearing out repo files"
for file in ${Files[@]}; do
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
for folder in ${Folders[@]}; do
    echo "copying $HOME/$folder to $WorkDir/$folder"
    cp -r $HOME/$folder/* $WorkDir/$folder
done

echo

echo "[+] Copying files"
for file in ${Files[@]}; do
    echo "copying $HOME/$file to $WorkDir/$file"
    cp $HOME/$file $WorkDir/$file
done

echo

# ========================= #
# = MPD specific commands = #
# ========================= #

echo "[-] MPD: Clearing out playlists"
for file in $WorkDir/.config/mpd/playlists/*; do
    echo "deleting playlist: $file"
    rm $file
done

echo

files=(log mpd.pid mpdstate sticker.sql)

echo "[-] MPD: Resetting temporary MPD files"
for file in ${files[@]}; do
    echo "clearing $WorkDir/.config/mpd/$file"
    truncate -s 0 "$WorkDir/.config/mpd/$file"
done
