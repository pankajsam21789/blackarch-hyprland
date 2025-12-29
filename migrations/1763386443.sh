echo "Uniquely identify terminal apps with custom app-ids using blackarch-launch-tui"

# Replace terminal -e calls with blackarch-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/blackarch-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use blackarch-launch-or-focus with blackarch-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|blackarch-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.blackarch\.Wiremix -e wiremix|blackarch-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
