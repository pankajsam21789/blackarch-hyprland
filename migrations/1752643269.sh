echo "Add new matte black theme"

if [[ ! -L "~/.config/blackarch/themes/matte-black" ]]; then
  ln -snf ~/.local/share/blackarch/themes/matte-black ~/.config/blackarch/themes/
fi
