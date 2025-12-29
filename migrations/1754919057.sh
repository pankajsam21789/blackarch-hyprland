echo "Improve tooltip for Blackarch menu icon"

if grep -q "SUPER + ALT + SPACE" ~/.config/waybar/config.jsonc; then
  sed -i 's/SUPER + ALT + SPACE/Blackarch Menu\\n\\nSuper + Alt + Space/' ~/.config/waybar/config.jsonc
fi
