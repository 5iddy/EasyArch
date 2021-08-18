#!/bin/sh

sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
locale-gen

echo "mypc" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 mypc" >> /etc/hosts

pacman -Syu grub git wget curl python python-pip zsh xorg dhcpcd networkmanager network-manager-applet \
xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings arc-gtk-theme papirus-icon-theme \
firefox chromium gvfs file-roller tumbler python-virtualenv ufw capitaine-cursors

systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable dhcpcd

ufw default allow outgoing
ufw default deny incoming
ufw enable
systemctl enable ufw


