sync_nvim_config:
	rsync -rv ~/.config/nvim/init.lua ~/.config/nvim/lua ./roles/neovim/files/config/

sync_sway_config:
	rsync -rv --exclude=config-outputs-current ~/.config/sway/* ./roles/sway/files/config/sway/

sync_dunst_config:
	rsync -rv ~/.config/dunst/* ./roles/sway/files/config/dunst/

sync_gammastep_config:
	rsync -rv ~/.config/gammastep/* ./roles/sway/files/config/gammastep/

sync_wofi_config:
	rsync -rv ~/.config/wofi/* ./roles/sway/files/config/wofi/

sync_alacritty_config:
	rsync -rv ~/.config/alacritty/* ./roles/sway/files/config/alacritty/

sync_kanshi_config:
	rsync -rv ~/.config/kanshi/* ./roles/sway/files/config/kanshi/

sync_waybar_config:
	rsync -rv ~/.config/waybar/* ./roles/sway/files/config/waybar/

sync_dotfiles: sync_nvim_config sync_sway_config sync_dunst_config sync_gammastep_config sync_wofi_config sync_alacritty_config sync_kanshi_config sync_waybar_config
