echo "Migrate to proper packages for localsend and asdcontrol"

if blackarch-pkg-present localsend-bin; then
  blackarch-pkg-drop localsend-bin
  blackarch-pkg-add localsend
fi

if blackarch-pkg-present asdcontrol-git; then
  blackarch-pkg-drop asdcontrol-git
  blackarch-pkg-add asdcontrol
fi
