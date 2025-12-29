echo "Change to blackarch-nvim package"
blackarch-pkg-drop blackarch-lazyvim
blackarch-pkg-add blackarch-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
blackarch-nvim-setup
