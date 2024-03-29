all: ~/.config/ctags/ujihisa.ctags \
	~/.gitconfig \
	~/.gitignore \
	~/.gvimrc \
	~/.vim \
	~/.vimbundles \
	~/.vimrc \
	~/.vimrc_secret \
	~/.config/autokey/data \
	~/.aws/credentials \
	~/.xinitrc \
	~/.xprofile \
	~/.ssh/config \
	~/.Xmodmap \
	~/.local/share/com.github.johnfactotum.Foliate \
	~/.config/fcitx/config \
	~/.bashrc \
	~/.config/systemd/user/quipper-tunnel.service

~/.config/ctags/ujihisa.ctags:
	mkdir -p ~/.config/ctags/
	ln -s $(HOME)/Dropbox/dotfiles/ctags ~/.config/ctags/ujihisa.ctags

~/.gitconfig:
	ln -s $(HOME)/Dropbox/_gitconfig ~/.gitconfig

~/.gitignore:
	ln -s $(HOME)/Dropbox/dotfiles/gitignore ~/.gitignore

~/.gvimrc:
	ln -s $(HOME)/git/config/_gvimrc ~/.gvimrc

~/.vim:
	ln -s $(HOME)/Dropbox/vim ~/.vim

~/.vimbundles:
	ln -s $(HOME)/Dropbox/vimbundles ~/.vimbundles

~/.vimrc:
	ln -s $(HOME)/git/config/_vimrc ~/.vimrc

~/.vimrc_secret:
	ln -s $(HOME)/Dropbox/vimrc_secret ~/.vimrc_secret

~/.config/autokey/data:
	mkdir -p ~/.config/autokey
	ln -s $(HOME)/Dropbox/config-autokey-data ~/.config/autokey/data

~/.aws/credentials:
	mkdir -p ~/.aws
	ln -s $(HOME)/Dropbox/dotfiles/aws-credentials ~/.aws/credentials

~/.xinitrc:
	ln -s $(HOME)/Dropbox/dotfiles/xinitrc ~/.xinitrc

~/.xprofile:
	ln -s $(HOME)/Dropbox/dotfiles/xprofile ~/.xprofile

~/.ssh/config:
	mkdir -p ~/.ssh
	ln -s $(HOME)/Dropbox/dotfiles/ssh-config ~/.ssh/config

~/.Xmodmap:
	ln -s $(HOME)/Dropbox/dotfiles/xmodmap ~/.Xmodmap

~/.local/share/com.github.johnfactotum.Foliate:
	ln -s $(HOME)/Dropbox/dotfiles/local-share-com.github.johnfactotum.Foliate ~/.local/share/com.github.johnfactotum.Foliate

~/.config/fcitx/config:
	ln -s $(HOME)/Dropbox/dotfiles/config-fcitx-config ~/.config/fcitx/config

~/.bashrc:
	ln -s $(HOME)/git/config/_bashrc ~/.bashrc

~/.config/systemd/user/quipper-tunnel.service:
	# systemctl --user restart quipper-tunnel
	# journalctl --user -u quipper-tunnel -f
	mkdir -p ~/.config/systemd/user/
	ln -s $(HOME)/Dropbox/dotfiles/config-systemd-user-quipper-tunnel.service ~/.config/systemd/user/quipper-tunnel.service
