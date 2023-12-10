#!/bin/sh

makingDirs() {
	mkdir $HOME/.clones
	mkdir $HOME/.config
	mkdir -p $HOME/.local/bin/
	mkdir $HOME/Downloads
	mkdir -p $HOME/Documents/pdfs/
}

gitClones() {
	sudo pacman -S git
	git clone --dept 1 https://github.com/Kavi-Arya/archdots.git
}

config() {

}

paruInstall() {
	git clone https://aur.archlinux.org/paru.git $HOME/.clones/paru
	cd $HOME/.clones/paru
	makepkg -si
}

dwm() {

}

pkgs() {
	sudo pacman -S --needed base-devel
	sudo pacman -S --needed - <./assets/pkgList.txt
	paru -S - <./assets/aurPkgs.txt
}
