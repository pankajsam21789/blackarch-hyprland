# Copy over Blackarch configs
mkdir -p ~/.config
cp -R ~/.local/share/blackarch/config/* ~/.config/

# Use default bashrc from Blackarch
cp ~/.local/share/blackarch/default/bashrc ~/.bashrc
