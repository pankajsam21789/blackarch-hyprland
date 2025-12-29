echo "Install Impala as new wifi selection TUI"

if blackarch-cmd-missing impala; then
  blackarch-pkg-add impala
  blackarch-refresh-waybar
fi
