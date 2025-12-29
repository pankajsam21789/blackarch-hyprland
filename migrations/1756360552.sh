echo "Move Blackarch Package Repository after Arch core/extra/multilib and remove AUR"

blackarch-refresh-pacman
sudo pacman -Syu --noconfirm
