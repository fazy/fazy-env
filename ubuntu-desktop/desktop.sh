#!/usr/bin/env bash

# Move launcher to the bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

# Set theme
gsettings set org.gnome.desktop.interface gtk-theme "Radiance"

# Bring menus back into the window
gsettings set com.canonical.Unity integrated-menus true
