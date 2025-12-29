source $BLACKARCH_INSTALL/preflight/guard.sh
source $BLACKARCH_INSTALL/preflight/begin.sh
run_logged $BLACKARCH_INSTALL/preflight/show-env.sh
run_logged $BLACKARCH_INSTALL/preflight/pacman.sh
run_logged $BLACKARCH_INSTALL/preflight/migrations.sh
run_logged $BLACKARCH_INSTALL/preflight/first-run-mode.sh
run_logged $BLACKARCH_INSTALL/preflight/disable-mkinitcpio.sh
