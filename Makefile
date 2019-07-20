all: ~/.ctags ~/.gitconfig ~/.gvimrc ~/.vim ~/.vimbundles ~/.vimrc ~/.vimrc_secret ~/.vimshrc ~/.config/autokey/data ~/.aws/credentials ~/.xinitrc ~/.ssh/config

~/.ctags:
	ln -s $(HOME)/Dropbox/_ctags ~/.ctags

~/.gitconfig:
	ln -s $(HOME)/Dropbox/_gitconfig ~/.gitconfig

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

~/.vimshrc:
	ln -s $(HOME)/Dropbox/_vimshrc ~/.vimshrc

~/.config/autokey/data:
	mkdir -p ~/.config/autokey
	ln -s $(HOME)/Dropbox/config-autokey-data ~/.config/autokey/data

~/.aws/credentials:
	mkdir -p ~/.aws
	ln -s $(HOME)/Dropbox/dotfiles/aws-credentials ~/.aws/credentials

~/.xinitrc:
	ln -s $(HOME)/Dropbox/dotfiles/xinitrc ~/.xinitrc

~/.ssh/config:
	mkdir -p ~/.ssh
	ln -s $(HOME)/Dropbox/dotfiles/ssh-config ~/.ssh/config
