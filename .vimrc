set nocompatible
set number relativenumber
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set ignorecase
set smarttab
set smartindent
set autoindent
set smartcase
set hlsearch
set incsearch
set scrolloff=10
set hidden
set autoread
" show trailing whitespaces
set listchars=tab:>·,trail:$,extends:>,precedes:<
 " Shows invisible characters
set list
filetype plugin on
syntax on

" enable scroll
set mouse=a

call plug#begin('~/.vim/plugged')
" aesthetics
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'markonm/traces.vim'
" airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'
Plug 'ryanoasis/vim-devicons'
" fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" linting and autocomplete
Plug 'w0rp/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" git
Plug 'airblade/vim-gitgutter'
" formatting
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup color scheme
set termguicolors "sets to true colors
let &t_ut=''
colorscheme gruvbox

" set editor update time to 100ms
set updatetime=100

" buffers jump to existing window
let g:fzf_buffers_jump = 1

" start deoplete
let g:deoplete#enable_at_startup = 1
" custom options
call deoplete#custom#option({
\ 'max_list': 30
\ })
" remap deoplete keys
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<TAB>"
" Don't show doc window
set completeopt-=preview

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" disable toggling auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsFlyMode = 0
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

" assign mapleader
let mapleader=" "

" copy to clipboard
vnoremap Y "+y

" paste from yank register
nnoremap p "0p
vnoremap p "0p
" paste from default register
nnoremap P ""p
vnoremap P ""p

" ctags goto definition
nnoremap tj <C-]>
" ctags next
nnoremap tn :tn<CR>
" ctags prev
nnoremap tp :tp<CR>

" easy buffer movement
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-l> :wincmd l<CR>
map <silent> <C-k> :wincmd k<CR>
map <leader>q :quit<CR>
map <leader>g :new<CR>
map <leader>v :vnew<CR>
map <M-l> :bn<CR>
map <M-h> :bp<CR>
" see .vim/plugin/Bclose.vim
map <M-d> :Bclose<CR>
map <M-n> :enew<CR>
map <M-Up> :res +5<CR>
map <M-Down> :res -5<CR>
map <M-Right> :vertical res +5<CR>
map <M-Left> :vertical res -5<CR>

" substitute makro
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" double esc to disable hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" map fzf
map <M-p> :FZF<CR>
map <leader>f :Lines<CR>
map <Leader>h :Helptags!<CR>

" nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" remap nerdcomment
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> :call NERDComment(0, "toggle")<CR>
