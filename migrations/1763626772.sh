echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/blackarch/themes/hackerman ]]; then
  rm -rf ~/.config/blackarch/themes/hackerman
  ln -nfs ~/.local/share/blackarch/themes/hackerman ~/.config/blackarch/themes/
fi
