#!/bin/bash

# A useful script for setting up Gnome environment quickly and nicely.

# For getting the current value of an property just enter:
# gsettings get <category> <property>

# For setting
# gsettings set <category> <property> <value>


# 1. Set default view to 'list' in Nautilus file manager:
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# 2. Set always show text-entry location:
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

# 3. Set always show hidden files
gsettings set org.gtk.Settings.FileChooser show-hidden true

# 4. Set change default “sort by” to “type” in nautilus
gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
