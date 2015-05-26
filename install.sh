#!/bin/sh
# inspired by janus git hub
# https://github.com/carlhuda/janus

echo "Checking basic layout"
[ ! -d ~/.vim ] && mkdir ~/.vim
[ ! -d ~/.vim/bundle ] && mkdir ~/.vim/bundle

echo "Checking solarized"
if [ ! -e ~/.vim/bundle/vim-colors-solarized ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 git://github.com/altercation/vim-colors-solarized.git
fi

echo "Checking wakatime"
if [ ! -e ~/.vim/bundle/vim-wakatime ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 git://github.com/wakatime/vim-wakatime.git
fi

echo "Checking incsearch"
if [ ! -e ~/.vim/bundle/incsearch.vim ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/haya14busa/incsearch.vim.git
fi

echo "Checking speeddating"
if [ ! -e ~/.vim/bundle/vim-speeddating ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/tpope/vim-speeddating.git
fi

echo "Checking unimpaired"
if [ ! -e ~/.vim/bundle/vim-unimpaired ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 git://github.com/tpope/vim-unimpaired.git
fi

echo "Checking trailing-whitespace"
if [ ! -e ~/.vim/bundle/vim-trailing-whitespace ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/bronson/vim-trailing-whitespace.git
fi

echo "Checking YouCompleteMe"
if [ ! -e ~/.vim/bundle/YouCompleteMe ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/Valloric/YouCompleteMe.git
	cd ~/.vim/bundle/YouCompleteMe
	git submodule update --init --recursive 
	./install.sh --clang-completer
fi


echo "Checking auto-pairs"
if [ ! -e ~/.vim/bundle/auto-pairs ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/jiangmiao/auto-pairs.git
fi

echo "Checking gutter"
if [ ! -e ~/.vim/bundle/vim-gitgutter ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/airblade/vim-gitgutter.git
fi

echo "Checking airline"
if [ ! -e ~/.vim/bundle/vim-airline ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/bling/vim-airline.git
fi

echo "Checking virtualenv"
if [ ! -e ~/.vim/bundle/vim-virtualenv ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/jmcantrell/vim-virtualenv.git
fi

echo "Checking fugitive"
if [ ! -e ~/.vim/bundle/vim-fugitive ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/tpope/vim-fugitive.git
fi

echo "Checking ident-object"
if [ ! -e ~/.vim/bundle/vim-indent-object ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object.git
fi

echo "Checking gundo"
if [ ! -e ~/.vim/bundle/gundo.vim ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/sjl/gundo.vim.git
fi

echo "Checking gnupg"
if [ ! -e ~/.vim/bundle/vim-gnupg ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/jamessan/vim-gnupg.git
fi

echo "Checking python.vim"
if [ ! -e ~/.vim/bundle/python.vim ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/vim-scripts/python.vim.git
fi

#echo "Checking python-mode"
#if [ ! -e ~/.vim/bundle/python-mode ] ; then
#	cd ~/.vim/bundle
#	git clone --depth 1 https://github.com/klen/python-mode.git
#fi

echo "Checking numbers"
if [ ! -e ~/.vim/bundle/numbers.vim ] ; then
	cd ~/.vim/bundle
	git clone --depth 1 https://github.com/myusuf3/numbers.vim.git
fi

echo "Checking flake8"
if [ ! -e ~/.vim/bundle/flake8-vim ] ; then
	cd ~/.vim/bundle
	git clone --recursive --depth 1 https://github.com/andviro/flake8-vim.git
	cp -rv ~/.vim/bundle/flake8-vim/ftplugin/ ~/.vim/
fi

echo "Checking nerdtree"
if [ ! -e ~/.vim/bundle/nerdtree ] ; then
	cd ~/.vim/bundle
	git clone --recursive --depth 1 https://github.com/scrooloose/nerdtree.git
fi

echo "Checking nerdtree-git-plugin"
if [ ! -e ~/.vim/bundle/nerdtree-git-plugin ] ; then
	cd ~/.vim/bundle
	git clone --recursive --depth 1 https://github.com/Xuyuanp/nerdtree-git-plugin.git
fi


echo "Checking vim-templates"
if [ ! -e ~/.vim/bundle/vim-templates ] ; then
	cd ~/.vim/bundle
	git clone --recursive --depth 1 https://github.com/ap/vim-templates.git
	ln -s ~/.vim/python.template ~/.vim/bundle/vim-templates/templates/python
fi

# This should be last
echo "Checking symlink for .vimrc"
if [ -f ~/.vimrc ] ; then
	if [ ! -L ~/.vimrc ] ; then
		echo "~/.vimrc is no symlink, showing content and storing as ~/vimrc"
		echo ""
		echo "----------"
		echo ""
		cat ~/.vimrc
		echo ""
		echo "----------"
		echo ""
		mv ~/.vimrc ~/vimrc
	fi
fi

if [ ! -L ~/.vimrc ] ; then
	echo "activating symlink"
	ln -s ~/.vim/vimrc ~/.vimrc
fi
