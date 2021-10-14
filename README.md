# EasyArch
EasyArch is a custom ISO made using archiso tool with Xfce4, Gparted and Firefox preinstalled. 
It also has an Nvidia flavour that comes with Nvidia drivers preinstalled, preloaded in the kernel using mkinitcpio,
and coolbit enabled to 4 so you can change the fan speed.

## The Rational
When I first got started with ArchLinux, the learning curve was steep because I was oblivious
to the terminal and shells in general (even though i used ubuntu for a 5 years until that 
point). I had to use my mobile phone to browse the installation guides. EasyArch is here to 
solve that problem by proving Xfce desktop and firefox. Another problem i faced was due to the
lack of nvidia drivers, which made my GPU heat up while I was trying figure stuff on my mobile phone.

## What EasyArch is Not?
Its not an automated installater. There are no installation scripts. You still need to do install things manually. Its purpose is to make it easier for newcommers to learn (which i recoomend you do).

## Build Instructions
You can also build the iso yourself but you need arch or an arch based distro for it to work.
I have only tested this on vanila arch.
1. Clone this repo
  
  `git clone https://github.com/5iddy/EasyArch.git`

2. CD into this repo folder
  
  `cd EasyArch`

3. Then initialise the flavor
  
  `sh create_iso.sh init linux`
                or
  `sh create_iso.sh init linux-nvidia`

Note: before you initialise make sure you have archiso package installed.
  
  `sudo pacman -S archiso`
  
  or you can also run the above two init commands with sudo
  
  `sudo sh create_iso.sh init linux`
  
  however, I suggest you should preinstall archiso.
  
4. Then build the iso 
  
  `sudo sh create_iso.sh build`

5. (Optional) Perform cleanup
  
  `sh create_iso.sh cleanup`
  
  If you installed archiso package with init command, you need to use sudo with cleanup as well.
