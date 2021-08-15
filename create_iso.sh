#!/bin/sh

# Install archiso
[[ $(pacman -Qs archiso) ]] || pacman -S archiso
# Copy the archiso profile relang to archiso
cp -r /usr/share/archiso/configs/releng archiso

# check if necessary directories exist if not create them
[ -d "build" ] || mkdir build
[ -d "tmp" ] || mkdir tmp

# check if tmp directory is empty
# if not delete everything in it
# finally run the mkarchiso command
[ "$(ls -A tmp)" ] &&  rm -r tmp/*
mkarchiso -v -w tmp -o build archiso 2>&1

