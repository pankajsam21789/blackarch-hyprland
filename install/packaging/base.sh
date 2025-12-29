# Install all base packages
mapfile -t packages < <(grep -v '^#' "$BLACKARCH_INSTALL/blackarch-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
