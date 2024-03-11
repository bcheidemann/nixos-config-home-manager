#!/usr/bin/env bash

# Setup wallpaper
swww init &
swww img ~/Wallpapers/current.jpg &

# Network manager applet
nm-applet --indicator &

# Bar
waybar &

# Notifications Daemon
dunst &

