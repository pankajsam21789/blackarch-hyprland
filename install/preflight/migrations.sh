BLACKARCH_MIGRATIONS_STATE_PATH=~/.local/state/blackarch/migrations
mkdir -p $BLACKARCH_MIGRATIONS_STATE_PATH

for file in ~/.local/share/blackarch/migrations/*.sh; do
  touch "$BLACKARCH_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
