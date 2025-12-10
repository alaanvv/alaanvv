cp -r ~/.config/lazygit/* config/lazygit/
cp -r ~/.config/kitty/*   config/kitty/
cp -r ~/.config/nvim/*    config/nvim/
cp -r ~/.local/bin/*      config/bin/

cp -n ~/.bashrc config/bashrc 2>/dev/null
cp -n ~/.gtkrc-2.0 config/gtkrc-2.0 2>/dev/null
cp -n ~/.digital.cfg config/digital.cfg 2>/dev/null
cp -n ~/.config/user-dirs.dirs config/user-dirs.dirs 2>/dev/null
cp -rn ~/.config/dunst/ config/ 2>/dev/null
cp -rn ~/.config/gtk-3.0/ config/ 2>/dev/null
cp -rn ~/.config/gtk-4.0/ config/ 2>/dev/null
cp -rn ~/.config/hypr/ config/ 2>/dev/null
cp -rn ~/.config/waybar/ config/ 2>/dev/null
cp -rn ~/.config/wofi/ config/ 2>/dev/null
cp -rn /etc/ly/ config/ 2>/dev/null
cp -rn ~/.themes/ config/.themes/ 2>/dev/null
