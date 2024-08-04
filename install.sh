#!/bin/sh
echo "

.___                 __         .__  .__  .__              ._._.
|   | ____   _______/  |______  |  | |  | |__| ____    ____| | |
|   |/    \ /  ___/\   __\__  \ |  | |  | |  |/    \  / ___\ | |
|   |   |  \\___ \  |  |  / __ \|  |_|  |_|  |   |  \/ /_/  >|\|
|___|___|  /____  > |__| (____  /____/____/__|___|  /\___  /____
         \/     \/            \/                  \//_____/ \/\/

"
makingDirs() {
	echo "PlaceHolder"
	mkdir $CONFIGDIR
	mkdir $ARCHDOTS
	mkdir -p $LOCBIN
	mkdir $HOME/Downloads
	mkdir -p $HOME/Documents/pdfs/
	echo "PlaceHolder"
}
makingDirs
CONFIGDIR=$("$HOME/.config")
ARCHDOTS=$("$HOME/.clones/archdots")
LOCBIN=$("$HOME/.local/bin")
AURHELPER="paru"

paruInstall() {
	echo "PlaceHolder"
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git $HOME/.clones/paru
	cd $HOME/.clones/paru || {
		echo "Failure"
		exit 1
	}
	makepkg -si
	echo "PlaceHolder"
}

pkgs() {
	echo "PlaceHolder"
	cd $ARCHDOTS || {
		echo "Failure"
		exit 1
	}
	sudo pacman -S --needed - <./assets/pkgList.txt
	$AURHELPER -S - <./assets/aurPkgs.txt
	echo "PlaceHolder"
}

config() {
	echo "PlaceHolder"
	cd $ARCHDOTS || {
		echo "Failure"
		exit 1
	}
	cp -r dwm dmenu st kitty zsh lf newsboat nsxiv zathura $CONFIGDIR
	cp -r .zprofile $HOME
	cp -r ./bin/* $LOCBIN
	sudo cp -r ./assets/xorgConfig/* /etc/X11/xorg.conf.d/
	sudo cp -r ./fonts/* /usr/share/fonts/
	sudo fc-cache -f -v && fc-cache -f -v
	echo "PlaceHolder"
}

dwmBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/dwm || {
		echo "Failure"
		exit 1
	}
	rm -rf ./config.h
	make
	sudo make install
	echo "PlaceHolder"
}

stBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/st || {
		echo "Failure"
		exit 1
	}
	make
	sudo make install
	echo "PlaceHolder"
}

dmenuBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/dmenu || {
		echo "Failure"
		exit 1
	}
	make
	sudo make install
	echo "PlaceHolder"
}

paruInstall
pkgs
config
dwmBuild
stBuild
dmenuBuild