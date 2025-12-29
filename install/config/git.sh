# Set identification from install inputs
if [[ -n "${BLACKARCH_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$BLACKARCH_USER_NAME"
fi

if [[ -n "${BLACKARCH_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$BLACKARCH_USER_EMAIL"
fi
