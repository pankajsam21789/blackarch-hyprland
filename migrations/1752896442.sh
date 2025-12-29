echo "Replace volume control GUI with a TUI"

if blackarch-cmd-missing wiremix; then
  blackarch-pkg-add wiremix
  blackarch-pkg-drop pavucontrol
  blackarch-refresh-applications
  blackarch-refresh-waybar
fi
