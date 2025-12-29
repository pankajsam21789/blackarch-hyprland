echo "Replace wofi with walker as the default launcher"

if blackarch-cmd-missing walker; then
  blackarch-pkg-add walker-bin libqalculate

  blackarch-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/blackarch/config/walker/* ~/.config/walker/
fi
