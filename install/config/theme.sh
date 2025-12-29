# Set links for Nautilius action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup theme links
mkdir -p ~/.config/blackarch/themes
for f in ~/.local/share/blackarch/themes/*; do ln -nfs "$f" ~/.config/blackarch/themes/; done

# Set initial theme
mkdir -p ~/.config/blackarch/current
ln -snf ~/.config/blackarch/themes/tokyo-night ~/.config/blackarch/current/theme
ln -snf ~/.config/blackarch/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/blackarch/current/background

# Set specific app links for current theme
# ~/.config/blackarch/current/theme/neovim.lua -> ~/.config/nvim/lua/plugins/theme.lua is handled via blackarch-setup-nvim

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/blackarch/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/blackarch/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium and Brave for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
