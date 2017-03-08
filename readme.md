克隆vim-conf仓库

git clone https://gitlab.com/waldonchen/vim-conf.git $VIM_CONF_DIR
安装Vundle.vim插件

cd $VIM_CONF_DIR
git submodule init
git submodule update
分别链接vimrc和vim到$HOME/.vimrc和$HOME/.vim

ln -s $VIM_CONF_DIR/vimrc $HOME/.vimrc
ln -s $VIM_CONF_DIR/vim $HOME/.vim
安装其他插件

vim +PluginInstall +qall
