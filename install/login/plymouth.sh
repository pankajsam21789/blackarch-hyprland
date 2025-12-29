if [ "$(plymouth-set-default-theme)" != "blackarch" ]; then
  sudo cp -r "$HOME/.local/share/blackarch/default/plymouth" /usr/share/plymouth/themes/blackarch/
  sudo plymouth-set-default-theme blackarch
fi
