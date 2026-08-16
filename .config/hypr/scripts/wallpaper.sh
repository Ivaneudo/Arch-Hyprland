#!/bin/bash

# Caminho ABSOLUTO da sua imagem
WALLPAPER="/home/ivaneudo/Images/Wallpaper/default.jpg"

# Aplica o wallpaper
swaybg -o eDP-1 -i /home/ivaneudo/Images/Wallpaper/default.jpg -m fill &

chmod +x ~/.config/hypr/scripts/wallpaper.sh