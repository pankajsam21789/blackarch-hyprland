echo "Add right-click terminal action to waybar blackarch menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f "$WAYBAR_CONFIG" ]] && ! grep -A5 '"custom/blackarch"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "blackarch-menu",/a\    "on-click-right": "blackarch-launch-terminal",' "$WAYBAR_CONFIG"
fi
