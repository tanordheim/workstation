sync_nvim_config:
	rsync -rv ~/.config/nvim/init.lua ~/.config/nvim/lua ./roles/neovim/files/config/

sync_wallpapers:
	rsync -rv ~/Pictures/Wallpapers/* ./roles/wallpapers/files/

sync_git_config:
	cp ~/.gitconfig ./roles/git/files/gitconfig

sync_tmux:
	cp ~/.config/tmux/tmux.conf ./roles/tmux/files/tmux.conf

sync_dotfiles: sync_nvim_config sync_wallpapers sync_git_config sync_tmux
