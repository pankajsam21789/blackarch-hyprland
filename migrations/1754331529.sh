echo "Update Waybar for new Blackarch menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  blackarch-refresh-waybar
fi
