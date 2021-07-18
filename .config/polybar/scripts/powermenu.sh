#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

## modified a bit by supercolbat :3


dir="~/.config/polybar/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_cmd="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Suspend"
logout=" Logout"

# Confirmation
confirm_exit() {
    rofi -dmenu -i -no-fixed-num-lines\
         -p "Are you sure? : "\
         -theme $dir/confirm.rasi
}

# Message
message() {
    rofi -theme "$dir/message.rasi" 
         -e "Available Options  -  y / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_cmd -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ ans == "y" || $ans == "Y" ]]; then
            systemctl poweroff
        elif [[ ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            message
        fi
        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "y" || $ans == "Y" ]]; then
            systemctl reboot
        elif [[ $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            message
        fi
        ;;
    $lock)
        betterlockscreen -l dimblur
        ;;
    $suspend)
        ans=$(confirm_exit &)
        if [[ $ans == "y" || $ans == "Y" ]]; then
            mpc -q pause
            amixer set Master mute
            betterlockscreen -l dimblur
            systemctl suspend
        elif [[ $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            message
        fi
        ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "y" || $ans == "Y" ]]; then
            bspc quit
        elif [[ $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            message
        fi
        ;;
esac
