#!/bin/sh
echo "PlaceHolder"
CONFIGDIR=$("$HOME/.config/")
ARCHDOTS=$("$HOME/.clones/archdots")
LOCBIN=$("$HOME/.local/bin")
AURHELPER="paru"

makingDirs() {
	echo "PlaceHolder"
	mkdir $CONFIGDIR
	mkdir $ARCHDOTS
	mkdir -p $LOCBIN
	mkdir $HOME/Downloads
	mkdir -p $HOME/Documents/pdfs/
	echo "PlaceHolder"
}

paruInstall() {
	echo "PlaceHolder"
	git clone https://aur.archlinux.org/paru.git $HOME/.clones/paru
	cd $HOME/.clones/paru
	makepkg -si
	echo "PlaceHolder"
}

pkgs() {
	echo "PlaceHolder"
	cd $ARCHDOTS
	sudo pacman -S --needed base-devel
	sudo pacman -S --needed - <./assets/pkgList.txt
	$AURHELPER -S - <./assets/aurPkgs.txt
	echo "PlaceHolder"
}

config() {
	echo "PlaceHolder"
	cd $ARCHDOTS
	cp - rdwm dmenu st kitty zsh $CONFIGDIR
	cp -r .zprofile $HOME
	sudo cp -r ./assets/xorgConfig/* /etc/X11/xorg.conf.d/
	sudo cp -r ./fonts/* /usr/share/fonts/
	sudo fc-cache -f -v && fc-cache -f -v
	echo "PlaceHolder"
}

dwmBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/dwm
	rm -rf ./config.h
	make
	sudo make install
	echo "PlaceHolder"
}

stBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/st
	make
	sudo make install
	echo "PlaceHolder"
}

dmenuBuild() {
	echo "PlaceHolder"
	cd $CONFIGDIR/dmenu
	make
	sudo make install
	echo "PlaceHolder"
}
