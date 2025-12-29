echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/blackarch-cmd-tzupdate/blackarch-launch-floating-terminal-with-presentation blackarch-tz-select/g' ~/.config/waybar/config.jsonc
