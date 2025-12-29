echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  blackarch-refresh-config waybar/style.css
  blackarch-restart-waybar
fi
