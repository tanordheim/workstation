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

sync_kitty_config:
	rsync -rv ~/.config/kitty/* ./roles/sway/files/config/kitty/

sync_kanshi_config:
	rsync -rv ~/.config/kanshi/* ./roles/sway/files/config/kanshi/

sync_waybar_config:
	rsync -rv ~/.config/waybar/* ./roles/sway/files/config/waybar/

sync_wallpapers:
	rsync -rv ~/wallpapers/* ./roles/wallpapers/files/

sync_git_config:
	cp ~/.gitconfig ./roles/git/files/gitconfig

sync_tmux:
	cp ~/.config/tmux/tmux.conf ./roles/tmux/files/tmux.conf

sync_dotfiles: sync_nvim_config sync_sway_config sync_dunst_config sync_gammastep_config sync_wofi_config sync_kitty_config sync_kanshi_config sync_waybar_config sync_wallpapers sync_git_config sync_tmux
