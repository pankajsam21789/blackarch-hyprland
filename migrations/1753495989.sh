echo "Allow updating of timezone by right-clicking on the clock (or running blackarch-cmd-tzupdate)"

if blackarch-cmd-missing tzupdate; then
  bash "$BLACKARCH_PATH/install/config/timezones.sh"
  blackarch-refresh-waybar
fi
