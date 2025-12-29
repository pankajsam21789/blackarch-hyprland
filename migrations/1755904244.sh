echo "Update fastfetch config with new Blackarch logo"

blackarch-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/blackarch/branding
cp $BLACKARCH_PATH/icon.txt ~/.config/blackarch/branding/about.txt
