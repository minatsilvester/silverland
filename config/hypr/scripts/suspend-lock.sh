#!/usr/bin/env bash

pidof hyprlock || hyprlock -c ~/.config/hypr/hyprlock.conf &
sleep 1
systemctl suspend
