#!/bin/sh

init(){
    # check if necessary directories exist if not create them
    [ -d "build" ] || mkdir build
    [ -d "tmp" ] || mkdir tmp
    [[ $(pacman -Qs archiso) ]] || sudo pacman -S archiso
    cp -r /usr/share/archiso/configs/releng archiso
    yes | cp -r src/* archiso/
    #for i in $(ls src)
    #do
    #    echo $i
    #    rm -r archiso/$i
    #    cp -r src/$i archiso/
    #done
}
# check if tmp directory is empty
# if not delete everything in it
# finally run the mkarchiso command
build(){
    [ "$(ls -A tmp)" ] &&  rm -r tmp/*
    sudo mkarchiso -v -w tmp -o build archiso 2>&1
}

case $1 in
    "init") init;;
    "build") build;;
esac
