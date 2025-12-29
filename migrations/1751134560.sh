echo "Add UWSM env"

export BLACKARCH_PATH="$HOME/.local/share/blackarch"
export PATH="$BLACKARCH_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export BLACKARCH_PATH=$HOME/.local/share/blackarch
export PATH=$BLACKARCH_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
blackarch-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/blackarch/migrations
touch ~/.local/state/blackarch/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old Blackarch installs
blackarch-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $BLACKARCH_PATH/migrations/1756060611.sh
touch ~/.local/state/blackarch/migrations/1756060611.sh

bash blackarch-update-perform
