echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/blackarch/themes/ristretto ]]; then
  ln -nfs ~/.local/share/blackarch/themes/ristretto ~/.config/blackarch/themes/
fi
