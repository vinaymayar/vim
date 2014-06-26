# Sets up .vim folder.
# Note: Vim-LaTeX plugin must be downloaded and compiled
# manually.  This script does not install it.
#
# Credits to Jeff DellaTezza - this script is based on his

vimdir=$HOME/.vim
bundledir=$vimdir/bundle
vimrc=$HOME/.vimrc

# Make necessary directories in ~/.vim.
mkdir -p $vimdir/autoload
mkdir -p $bundledir

# Install pathogen for package management.
curl -LSso $vimdir/autoload/pathogen.vim https://tpo.pe/pathogen.vim

if [ $? -ne 0 ]
then
    echo "Error downloading pathogen."
    exit 1
fi

# Copy old vimrc.
if [ -e $vimrc ]
then
    cp $vimrc "$HOME/.vimrc.pre-install-`date`"
fi

#Create new vimrc.
cp -rf ./vinrc $vimrc

githubdirs=("nerdtree" "ctrlp.vim" "vim-easymotion" "vim-multiple-cursors"\
    "vim-colors-solarized" "vim-fugitive" "vim-scala" "vim-coffee-script" "ack.vim"\
    "vim-go")
repos=("scrooloose/nerdtree.git" "kien/ctrlp.vim" "Lokaltog/vim-easymotion"\
    "terryma/vim-multiple-cursors.git" "altercation/vim-colors-solarized.git"\
    "tpope/vim-fugitive" "derekwyatt/vim-scala.git" "kchmck/vim-coffee-script"\
    "mileszs/ack.vim" "fatih/vim-go.git")

for idx in ${!githubdirs[*]}
do
    dir=$bundledir/${githubdirs[$idx]}
    repo=${repos[$idx]}
    if [ ! -d $dir ]; then
        git clone http://github.com/$repo $dir
        if [ $? -ne 0 ]
        then
            echo "Error cloning $repo."
            exit 1
        fi
    else
        echo "Directory: $dir already exists. Skipping..."
    fi
done
exit 0
