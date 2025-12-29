echo "Adding Blackarch version info to fastfetch"
if ! grep -q "blackarch" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/blackarch/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

