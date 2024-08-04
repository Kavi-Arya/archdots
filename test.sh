CONFIGDIR=$("$HOME/.config")
ARCHDOTS=$("$HOME/.clones/archdots")
LOCBIN=$("$HOME/.local/bin")
AURHELPER="paru"

makingDirs() {
	echo "PlaceHolder"
	mkdir $CONFIGDIR
	mkdir $ARCHDOTS
	mkdir -p $LOCBIN
	echo "PlaceHolder"
}
makingDirs