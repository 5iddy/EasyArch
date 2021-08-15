#!/bin/sh

# check if internet is working by pinging dns serves or exit
ping -q -c 1 -W 1 8.8.8.8 >/dev/null || echo "No internet found" && exit

# set time to sync with internet
timedatectl set-ntp true
# set timezone to Asia/Kolkata
timedatectl set-timezone Asia/Kolkata
# syncing hardware clock to system
hwclock -systohc
# install base packages to root partition
pacstrap /mnt base base-devel linux linux-headers linux-firmware
# generate fstab to automount drives
genfstab -U /mnt > /mnt/etc/fstab
# copy the second script to mounted root partiton
cp /scripts/install_2.sh /mnt/scripts/install_2.sh
# run the second installation script
mkdir /mnt/scripts
arch-chroot /mnt /scripts/install_2.sh && rm /mnt/scripts/install_2.sh

