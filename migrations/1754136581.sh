echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "blackarch-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  blackarch-refresh-hypridle
  blackarch-refresh-hyprlock
fi
