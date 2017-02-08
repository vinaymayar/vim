set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'gre/play2vim'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'panagosg7/vim-annotations'
Plugin 'phleet/vim-mercenary'

call vundle#end()
filetype plugin indent on

syntax enable
set nocompatible
set tabstop=4
set shiftwidth=4
set nu
set smarttab autoindent
set smartcase
set smartindent
set expandtab
set tabpagemax=100

" Tags
set tags=tags;~

" Backspace
set backspace=indent,eol,start

" Wrap lines
set whichwrap+=<,>,h,l,[,]

" Mouse, for easy split window adjusting.
" Note: doesn't work in Terminal.
set mouse=a

" Don't ask to open these types of files.
set wildignore+=*.zip,*.swp,*.class,*.pyc,*.o,*.so

" Some useful maps
" {{{
noremap ; :

" Copy paste from clipboard
" set clipboard=unnamed
vnoremap <C-c> "*y
" Using <C-b> in cmd mode because <C-v> is taken (and useful)
noremap <C-b> "*p
inoremap <C-v> <Esc>"*p`]a
" Copy whole file
noremap <C-y> myggvG$"*y`y
inoremap <C-y> <Esc>myggvG$"*y`ya

" Useful maps 
" }}}

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" LaTeX
" {{{
set grepprg=grep\ -nH\ $*
filetype indent on 
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='vimlatex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app'
let g:Tex_ViewRule_dvi = 'open -a /Applications/Preview.app'
let g:Tex_EnvironmentMaps = 0
let g:Tex_EnvironmentMenus = 0
let g:Imap_UsePlaceHolders = 0

" Save, compile, and view.
autocmd FileType tex map <Leader>c <Esc>:w<Return><Plug>Tex_Compile<Plug>Tex_View

" Auto-close braces and brackets.
autocmd FileType tex inoremap {      {}<Left>
autocmd FileType tex inoremap {<CR>  {<CR>}<Esc>O
autocmd FileType tex inoremap {{     {
autocmd FileType tex inoremap {}     {}
autocmd FileType tex inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

autocmd FileType tex inoremap [      []<Left>
" autocmd FileType tex inoremap [<CR>  [<CR>]<Esc>O
autocmd FileType tex inoremap [[     [
autocmd FileType tex inoremap []     []
autocmd FileType tex inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" LaTeX
" }}}

" Scala
" {{{
" Indents
autocmd FileType scala set tabstop=2
autocmd FileType scala set shiftwidth=2

" Sorting imports
let g:scala_first_party_namespaces='\(controllers\|views\|models\|util\|de.\)'
autocmd FileType scala map <Leader>s :SortScalaImports<CR>
" Scala
" }}}

" Haskell
" {{{
au BufNewFile,BufRead *.sq set filetype=haskell
let g:vim_annotations_offset = '/.liquid/'
autocmd FileType haskell set tabstop=2
autocmd FileType haskell set shiftwidth=2
" }}}

" CoffeeScript
" {{{
autocmd FileType coffee set tabstop=2
autocmd FileType coffee set shiftwidth=2
" CoffeeScript
" }}}

" Ruby
" {{{
" Indents
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2
" }}}

" HTML
" {{{
" Indents
au BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
" }}}

" JavaScript
" {{{
" Indents
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
" }}}

" if has("autocmd")
"     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"         \| exe "normal! g'\"" | endif
" endif

" Now using Vundle, so this should stay commented.
" execute pathogen#infect()

" Solarized color scheme
set background=dark
colorscheme solarized

" Open NerdTree if vim starts with no files
" autocmd vimenter * if !argc() | NERDTree | endif

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Control-P
map <C-p> :CtrlP<CR>
map <Leader>] :CtrlPTag<CR>

" Multiple Cursors
" {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Multiple Cursors
" }}}
