# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(BLACKARCH_CHROOT_INSTALL|BLACKARCH_ONLINE_INSTALL|BLACKARCH_USER_NAME|BLACKARCH_USER_EMAIL|USER|HOME|BLACKARCH_REPO|BLACKARCH_REF|BLACKARCH_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
