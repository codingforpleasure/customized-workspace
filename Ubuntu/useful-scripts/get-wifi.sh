#!/bin/bash

sudo service network-manager restart

killall nm-applet && nm-applet &
