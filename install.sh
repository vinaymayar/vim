# Sets up .vim folder.
# Note: Vim-LaTeX plugin must be downloaded and compiled
# manually.  This script does not install it.
#
vimdir=$HOME/.vim
bundledir=$vimdir/bundle
vimrc=$HOME/.vimrc

# Make necessary directories in ~/.vim.
mkdir -p $vimdir/autoload
mkdir -p $bundledir

# Copy old vimrc.
if [ -e $vimrc ]
then
    cp $vimrc "$HOME/.vimrc.pre-install-`date`"
fi

#Create new vimrc.
cp -rf ./vimrc $vimrc
exit 0
