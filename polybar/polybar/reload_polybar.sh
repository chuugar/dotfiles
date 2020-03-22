#!/usr/bin/env bash

killall polybar

while getopts 'sdt' OPT; do
    case $OPT in
        s)
            echo "Configuring polybar for single monitor"
            polybar --reload -c ~/.config/polybar/config.desktop singlemonitor_bottom &
            polybar --reload -c ~/.config/polybar/config.desktop singlemonitor_top &
            ;;
        d)
            echo "Configuring polybar for double monitor"
            polybar --reload -c ~/.config/polybar/config.desktop main &
            polybar --reload -c ~/.config/polybar/config.desktop lite &
            ;;
        t)
            echo "Configuring polybar for triple monitor"
            ;;
    esac
done
