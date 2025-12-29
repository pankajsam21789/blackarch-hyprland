echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/blackarch/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/blackarch/themes/catppuccin-latte ~/.config/blackarch/themes/
fi
