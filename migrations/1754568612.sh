echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Blackarch --title Blackarch -e blackarch-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Blackarch --title Blackarch -e \)blackarch-update"|\1blackarch-update"|' ~/.config/waybar/config.jsonc
  blackarch-restart-waybar
fi
