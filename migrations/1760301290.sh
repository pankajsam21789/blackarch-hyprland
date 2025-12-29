echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/blackarch/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/blackarch/themes/flexoki-light ~/.config/blackarch/themes/
fi
