#!/bin/bash

if [ "$1" == "light" ]; then
    echo "Changing to LIGHT..."
    xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Light"
    #xfconf-query -c xsettings -p /Net/PreferDarkTheme -s false
elif [ "$1" == "dark" ]; then
    echo "Changing to DARK..."
    xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
    #xfconf-query -c xsettings -p /Net/PreferDarkTheme -s true
else
    echo "Usage: $0 [light|dark]"
    exit 1
fi

xfdesktop --reload
xfwm4 --replace &

echo "Theme changed! To sync firefox theme go to:"
echo "Settings Manager > Desktop settings > Applications"

