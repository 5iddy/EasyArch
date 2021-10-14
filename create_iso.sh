#!/bin/sh

init(){
    # check if necessary directories exist if not create them
    [ -d "build" ] || mkdir build
    [ -d "tmp" ] || mkdir tmp
    [[ $(pacman -Qs archiso) ]] || pacman -S archiso
    # check if archiso folder exists and remove it
    [ -d "archiso" ] && rm -r archiso
    # copy the releng profile over to archiso
    cp -r /usr/share/archiso/configs/releng archiso
    # replace releng's defaults profiles with Easy Linux presets
    [[ -n $1 ]] && [[ $1 == "linux" ]] && yes | cp -r src/linux/* archiso/
    [[ -n $1 ]] && [[ $1 == "linux-nvidia" ]] && yes | cp -r src/linux-nvidia/* archiso/
}

build(){
    # check if tmp directory is empty
    # if not delete everything in it
    [ "$(ls -A tmp)" ] && rm -rf tmp/*
    # finally run the mkarchiso command
    # tmp needs to be empty for mkarchiso to work
    mkarchiso -v -w tmp -o build archiso 2>&1
}

sign(){
    # Finally sign the iso file with user gpg keys
    # gpg -b -o $1.sig $1 
    # generate checksums for the iso
    sha512sum -bz $1 > $1.sha512sum 
}

cleanup(){
    rm -r tmp
    rm -r archiso
    [[ $1 == "build" ]] && rm -r build
}


case $1 in
    "init") init $2;;
    "build") build;;
    "sign") sign $2;;
    "cleanup") cleanup $2;;
esac
