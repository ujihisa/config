all: ~/.ctags ~/.gitconfig ~/.gvimrc ~/.vim ~/.vimbundles ~/.vimrc ~/.vimrc_secret ~/.vimshrc

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

