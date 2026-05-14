#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  exec sudo "$0" "$@"
fi

apt install meson ninja-build libseat-dev libx11-xcb-dev libxcb-composite0-dev lua5.4 liblua5.4-dev -y

# ----------------- wayland-protocols

rm -rf wayland
git clone https://gitlab.freedesktop.org/wayland/wayland.git
cd wayland
git checkout 1.23.0

meson setup build/ --prefix=/usr -Ddocumentation=false
ninja -C build/
ninja -C build/ install

cd ..

# ----------------- wayland-protocols

rm -rf wayland-protocols
git clone https://gitlab.freedesktop.org/wayland/wayland-protocols.git
cd wayland-protocols
git checkout 1.46

meson setup build/
ninja -C build/
ninja -C build/ install

cd ..

# ----------------- weston

rm -rf weston
git clone https://gitlab.freedesktop.org/wayland/weston.git
cd weston
git checkout 15.0.0

meson setup build/ -Dbackend-vnc=false -Dcolor-management-lcms=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Dpipewire=false -Dtests=false
ninja -C build/
ninja -C build/ install
