all: ~/.ctags ~/.gitconfig ~/.gvimrc ~/.vim ~/.vimbundles ~/.vimrc ~/.vimrc_secret ~/.vimshrc

~/.ctags:
	ln -s /home/ujihisa/Dropbox/_ctags ~/.ctags

~/.gitconfig:
	ln -s /home/ujihisa/Dropbox/_gitconfig ~/.gitconfig

~/.gvimrc:
	ln -s /home/ujihisa/git/config/_gvimrc ~/.gvimrc

~/.vim:
	ln -s /home/ujihisa/Dropbox/vim ~/.vim

~/.vimbundles:
	ln -s /home/ujihisa/Dropbox/vimbundles ~/.vimbundles

~/.vimrc:
	ln -s /home/ujihisa/git/config/_vimrc ~/.vimrc

~/.vimrc_secret:
	ln -s /home/ujihisa/Dropbox/vimrc_secret ~/.vimrc_secret

~/.vimshrc:
	ln -s /home/ujihisa/Dropbox/_vimshrc ~/.vimshrc

