echo "Add new Blackarch Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/blackarch/config/blackarch.ttf ~/.local/share/fonts/
fc-cache
