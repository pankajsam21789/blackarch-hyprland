echo "Replace bluetooth GUI with TUI"

blackarch-pkg-add bluetui
blackarch-pkg-drop blueberry

if ! grep -q "blackarch-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/blackarch-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
