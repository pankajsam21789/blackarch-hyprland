echo "Install swayOSD to show volume status"

if blackarch-cmd-missing swayosd-server; then
  blackarch-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
