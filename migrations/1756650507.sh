echo "Fix JetBrains font setting"

if [[ $(blackarch-font-current) == JetBrains* ]]; then
  blackarch-font-set "JetBrainsMono Nerd Font"
fi
