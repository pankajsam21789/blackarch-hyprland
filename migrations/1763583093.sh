echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/blackarch/themes/ethereal ]]; then
  rm -rf ~/.config/blackarch/themes/ethereal
  ln -nfs ~/.local/share/blackarch/themes/ethereal ~/.config/blackarch/themes/
fi
