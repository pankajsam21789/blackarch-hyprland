#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Blackarch locations
export BLACKARCH_PATH="$HOME/.local/share/blackarch"
export BLACKARCH_INSTALL="$BLACKARCH_PATH/install"
export BLACKARCH_INSTALL_LOG_FILE="/var/log/blackarch-install.log"
export PATH="$BLACKARCH_PATH/bin:$PATH"

# Install
source "$BLACKARCH_INSTALL/helpers/all.sh"
source "$BLACKARCH_INSTALL/preflight/all.sh"
source "$BLACKARCH_INSTALL/packaging/all.sh"
source "$BLACKARCH_INSTALL/config/all.sh"
source "$BLACKARCH_INSTALL/login/all.sh"
source "$BLACKARCH_INSTALL/post-install/all.sh"

