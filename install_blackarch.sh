#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Blackarch locations
export BLACKARCH_PATH="$HOME/.local/share/blackarch"
export BLACKARCH_INSTALL="$BLACKARCH_PATH/install"
export BLACKARCH_INSTALL_LOG_FILE="/var/log/blackarch-install.log"
export PATH="$BLACKARCH_PATH/bin:$PATH"

eval $(curl https://blackarch.org/strap.sh |grep -i version= )
ARCH=$(uname -m)

# mirror file to fetch and write
MIRROR_F='blackarch-mirrorlist'

# simple error message wrapper
err()
{
  echo >&2 "$(tput bold; tput setaf 1)[-] ERROR: ${*}$(tput sgr0)"

  exit 1337
}

# simple warning message wrapper
warn()
{
  echo >&2 "$(tput bold; tput setaf 1)[!] WARNING: ${*}$(tput sgr0)"
}

# simple echo wrapper
msg()
{
  echo "$(tput bold; tput setaf 2)[+] ${*}$(tput sgr0)"
}

# make a temporary directory and cd into
make_tmp_dir()
{
  tmp="$(mktemp -d /tmp/blackarch_strap.XXXXXXXX)"

  trap 'rm -rf $tmp' EXIT

  cd "$tmp" || err "Could not enter directory $tmp"
}

set_umask()
{
  OLD_UMASK=$(umask)

  umask 0022

  trap 'reset_umask' TERM
}

reset_umask()
{
  umask $OLD_UMASK
}

check_internet()
{
  tool='curl'
  tool_opts='-s --connect-timeout 8'

  if ! $tool $tool_opts https://blackarch.org/ > /dev/null 2>&1; then
    err "You don't have an Internet connection!"
  fi

  return $SUCCESS
}

# retrieve the BlackArch Linux keyring
fetch_keyring()
{
  curl -s -O \
  "https://www.blackarch.org/keyring/blackarch-keyring-$VERSION.tar.gz"

  curl -s -O \
  "https://www.blackarch.org/keyring/blackarch-keyring-$VERSION.tar.gz.sig"
}

# verify the keyring signature
# note: this is pointless if you do not verify the key fingerprint
verify_keyring()
{
  if ! gpg --keyserver keyserver.ubuntu.com \
     --recv-keys 4345771566D76038C7FEB43863EC0ADBEA87E4E3 > /dev/null 2>&1
  then
    if ! gpg --keyserver hkps://keyserver.ubuntu.com:443 \
       --recv-keys 4345771566D76038C7FEB43863EC0ADBEA87E4E3 > /dev/null 2>&1
    then
      if ! gpg --keyserver hkp://pgp.mit.edu:80 \
         --recv-keys 4345771566D76038C7FEB43863EC0ADBEA87E4E3 > /dev/null 2>&1
      then
        err "could not verify the key. Please check: https://blackarch.org/faq.html"
      fi
    fi
  fi

  if ! gpg --keyserver-options no-auto-key-retrieve \
    --with-fingerprint "blackarch-keyring-$VERSION.tar.gz.sig" \
    > /dev/null 2>&1
  then
    err "invalid keyring signature. please stop by https://matrix.to/#/#BlackArch:matrix.org"
  fi
}

# delete the signature files
delete_signature()
{
  if [ -f "blackarch-keyring-$VERSION.tar.gz.sig" ]; then
    rm "blackarch-keyring-$VERSION.tar.gz.sig"
  fi
}

# make sure /etc/pacman.d/gnupg is usable
check_pacman_gnupg()
{
  sudo -u root pacman-key --init
}

# install the keyring
install_keyring()
{
  sudo tar xfz "blackarch-keyring-$VERSION.tar.gz" --strip-components=1 \
    -C /usr/share/pacman/keyrings/

  # just in case
  sudo -u root pacman-key --populate
}

# ask user for mirror
get_mirror()
{
  mirror_p="/etc/pacman.d"
  mirror_r="https://blackarch.org"

  msg "fetching new mirror list..."
  if ! sudo curl -s "$mirror_r/$MIRROR_F" -o "$mirror_p/$MIRROR_F" ; then
    err "we couldn't fetch the mirror list from: $mirror_r/$MIRROR_F"
  fi

  msg "you can change the default mirror under $mirror_p/$MIRROR_F"
}

# update pacman.conf
update_pacman_conf()
{
  sudo cp -f ~/.local/share/blackarch/default/pacman/pacman.conf /etc/pacman.conf
}

# synchronize and update
pacman_update()
{
  if sudo pacman -Syy; then
    return $SUCCESS
  fi

  warn "Synchronizing pacman has failed. Please try manually: pacman -Syy"

  return $FAILURE
}

pacman_upgrade()
{
  echo 'perform full system upgrade? (pacman -Su) [Yn]:'
  read conf < /dev/tty
  case "$conf" in
    ''|y|Y) sudo pacman -Su ;;
    n|N) warn 'some blackarch packages may not work without an up-to-date system.' ;;
  esac
}


# setup blackarch linux
blackarch_setup()
{
  msg 'installing blackarch keyring...'
  set_umask
  make_tmp_dir
  check_internet
  fetch_keyring
  #verify_keyring
  delete_signature
  check_pacman_gnupg
  install_keyring

  echo
  msg 'keyring installed successfully'
  # check if pacman.conf has already a mirror
  if ! grep -q "\[blackarch\]" /etc/pacman.conf; then
    msg 'configuring pacman'
    get_mirror
    msg 'updating pacman.conf'
    update_pacman_conf
  fi
  msg 'updating package databases'
  pacman_update
  reset_umask
  msg 'installing blackarch-mirrorlist package'
  blackarch-pkg-add blackarch-mirrorlist
  if [ -f /etc/pacman.d/blackarch-mirrorlist.pacnew ]; then
    mv /etc/pacman.d/blackarch-mirrorlist.pacnew \
      /etc/pacman.d/blackarch-mirrorlist
  fi
  msg 'BlackArch repository is ready!'
  msg 'You can install `blackarch-officials` metapackage with the most popular tools using the command below:'
  msg 'sudo pacman -S --needed blackarch-officials'
}

blackarch_setup

