#!/bin/bash

mkdir -p /etc/xdg/weston

cp weston_configuration/weston.ini /etc/xdg/weston/weston.ini
cp weston_configuration/weston_shell.lua /weston_shell.lua

chmod 755 /etc/xdg/weston/weston.ini
chmod 755 /weston_shell.lua
