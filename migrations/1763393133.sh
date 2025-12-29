echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $BLACKARCH_PATH/default/elephant/blackarch_themes.lua ~/.config/elephant/menus/blackarch_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
blackarch-restart-walker
