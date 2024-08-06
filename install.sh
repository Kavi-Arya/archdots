#!/bin/sh
echo "

.___                 __         .__  .__  .__              ._._.
|   | ____   _______/  |______  |  | |  | |__| ____    ____| | |
|   |/    \ /  ___/\   __\__  \ |  | |  | |  |/    \  / ___\ | |
|   |   |  \\___ \  |  |  / __ \|  |_|  |_|  |   |  \/ /_/  >|\|
|___|___|  /____  > |__| (____  /____/____/__|___|  /\___  /____
         \/     \/            \/                  \//_____/ \/\/

"

CONFIGDIR=$("$HOME/.config")
ARCHDOTS=$("$HOME/.clones/archdots")
LOCBIN=$("$HOME/.local/bin")
AURHELPER="paru"

makingDirs() {
	echo "Making Needed Directory"
	mkdir "$CONFIGDIR"
	mkdir "$ARCHDOTS"
	mkdir -p "$LOCBIN"
	mkdir "$HOME/Downloads"
	mkdir -p "$HOME/Documents/pdfs/"
	echo "DONE!!"
}

paruInstall() {
	echo "Installing Paru aur manager"
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git "$HOME/.clones/paru"
	cd "$HOME/.clones/paru" || {
		echo "Failure"
		exit 1
	}
	makepkg -si
	echo "DONE!"
}

pkgs() {
	echo "Installing Pkgs"
	cd "$ARCHDOTS" || {
		echo "Failure"
		exit 1
	}
  sudo pacman -Syyu
  cat ./assets/pkgList.txt | sudo pacma -S
  cat ./assets/aurPkgs.txt | sudo "$AURHELPER" -S
	echo "DONE!"
}

config() {
	echo "Moving Shit"
	cd "$ARCHDOTS" || {
		echo "Failure"
		exit 1
	}
	cp -r dwm dmenu st kitty zsh lf newsboat nsxiv zathura "$CONFIGDIR"
	cp -r .zprofile "$HOME"
	cp -r ./bin/* "$LOCBIN"
	sudo cp -r ./assets/xorgConfig/* /etc/X11/xorg.conf.d/
	sudo cp -r ./fonts/* /usr/share/fonts/
	sudo fc-cache -f -v && fc-cache -f -v
	echo "DONE!"
}

dwmBuild() {
	echo "Building dwm"
	cd "$CONFIGDIR/dwm" || {
		echo "Failure"
		exit 1
	}
	rm -rf ./config.h
	make
	sudo make install
	echo "DONE!"
}

stBuild() {
	echo "Building st"
	cd "$CONFIGDIR"/st || {
		echo "Failure"
		exit 1
	}
	make
	sudo make install
	echo "DONE!"
}

dmenuBuild() {
	echo "Building dmenu"
	cd "$CONFIGDIR"/dmenu || {
		echo "Failure"
		exit 1
	}
	make
	sudo make install
	echo "DONE!"
}

makingDirs
paruInstall
pkgs
config
dwmBuild
stBuild
dmenuBuild
