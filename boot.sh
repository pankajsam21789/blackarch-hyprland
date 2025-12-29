#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export BLACKARCH_ONLINE_INSTALL=true

ansi_art='                 ▄▄▄                                                   
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄ 
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀ 
                                       ███   █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/blackarch
BLACKARCH_REPO="${BLACKARCH_REPO:-basecamp/blackarch}"

echo -e "\nCloning Blackarch from: https://github.com/${BLACKARCH_REPO}.git"
rm -rf ~/.local/share/blackarch/
git clone "https://github.com/${BLACKARCH_REPO}.git" ~/.local/share/blackarch >/dev/null

# Use custom branch if instructed, otherwise default to master
BLACKARCH_REF="${BLACKARCH_REF:-master}"
if [[ $BLACKARCH_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $BLACKARCH_REF\e[0m"
  cd ~/.local/share/blackarch
  git fetch origin "${BLACKARCH_REF}" && git checkout "${BLACKARCH_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/blackarch/install.sh
