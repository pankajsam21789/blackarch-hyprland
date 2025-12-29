echo "Add minimal starship prompt to terminal"

if blackarch-cmd-missing starship; then
  blackarch-pkg-add starship
  cp $BLACKARCH_PATH/config/starship.toml ~/.config/starship.toml
fi
