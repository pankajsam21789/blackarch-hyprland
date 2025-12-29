echo "Change blackarch-screenrecord to use gpu-screen-recorder"
blackarch-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
blackarch-pkg-add slurp gpu-screen-recorder
