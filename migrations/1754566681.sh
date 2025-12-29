echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/blackarch/themes/osaka-jade ]]; then
  rm -rf ~/.config/blackarch/themes/osaka-jade
  git -C ~/.local/share/blackarch checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/blackarch/themes/osaka-jade ~/.config/blackarch/themes/osaka-jade
fi
