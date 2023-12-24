" General settings
set nocompatible
filetype plugin indent on
syntax enable

" File format preferences
set fileformats=unix,dos

" Default encoding settings
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

" Leader key
let g:mapleader = ","

" Key mappings
imap jk <Esc>
nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>

" Custom Commands
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Home & End navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Home & End navigation
nmap <C-l> g$
nmap <C-h> g0
vmap <C-l> g$
vmap <C-h> g0

" Tabs management
map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Open preview in browser
" port 80 disabled
nmap <F5> :silent !google-chrome-stable %:p &>/dev/null 2>&1<CR>:redraw!<CR>
" port 80 enabled
"nmap <F5> :silent !google-chrome-stable %:p:s?\(.\{-}/\)\{4}?http://localhost/?>/dev/null 2>&1<CR>:redraw!<CR>

" Mouse and clipboard
" sudo apt install xclip
vmap <C-c> y:call system("xclip -selection clipboard", @")<Cr>
set pastetoggle=<F4>

" Search and matching
nmap <space> %
set matchtime=2
set showmatch

" User interface
set showcmd
set cmdheight=2
set laststatus=2
set statusline=[%n]\ [%{&ff}:%{&fenc}:%Y]\ [ASCII=%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %F%m%r%h%w

" Editing enhancements
set backspace=indent,eol,start
set number
set incsearch
set ignorecase
set smartcase
set nohlsearch
" no highlight, two options {
"nmap <Esc><Esc> :noh<CR>
"autocmd InsertEnter * :let @/=""
" }
set magic
set lazyredraw
set wildmenu
set wildmode=longest:full
set whichwrap=b,s,h,l,<,>,[,]
set list listchars=eol:$,tab:▸-,nbsp:␣,trail:•,precedes:«,extends:»
set showbreak=↪\
set showmode
set cursorline
set hidden

" Indentation settings
set wrap
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Auto remove comment leader on new line
autocmd FileType,BufNewFile,BufRead * setlocal fo-=c fo-=r fo-=o fo-=q fo-=l

" Clean up whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Handle BOM for UTF-16 and UTF-32 appropriately
function! HandleBOM()
  if &fileencoding =~ 'utf-16' || &fileencoding =~ 'utf-32'
    setlocal bomb
  else
    setlocal nobomb
  endif
endfunction

" Apply the function when opening files
autocmd BufReadPre * call HandleBOM()

" Enable omni completion.
"augroup omnicomplete
"autocmd!
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType javascript setlocal omnifunc=tern#Complete
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType sql set omnifunc=sqlcomplete#Complete
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType go set omnifunc=gocomplete#Complete
"autocmd FileType golang set omnifunc=gocomplete#Complete
"autocmd FileType java set completefunc=javacomplete#CompleteParamsInfo
"autocmd FileType java set omnifunc=javacomplete#Complete
"autocmd FileType ruby set omnifunc=rubycomplete#Complete
"augroup END

" History & Backup Settings
set history=100
set undolevels=500
set undoreload=1000
set autoread
set nobackup
set nowritebackup
set noswapfile
set viminfo="NONE"

" Spelling
map <leader>ss :setlocal spell! spelllang=en,es<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>s? z=
map <leader>sa zg

" Plugin management
call plug#begin()
" List of plugins goes here
" Plug 'https://github.com/preservim/nerdtree.git'
" Plug 'https://github.com/majutsushi/tagbar.git'
" Plug 'https://github.com/scrooloose/nerdcommenter.git'
" Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'https://github.com/ntpeters/vim-better-whitespace.git'
" Plug 'https://github.com/othree/html5.vim.git'
" Plug 'https://github.com/mattn/emmet-vim.git'
" Plug 'https://github.com/alvan/vim-closetag.git'
" Plug 'https://github.com/AndrewRadev/tagalong.vim.git'
Plug 'https://github.com/vim-scripts/matchit.zip.git'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Plug 'https://github.com/vim-scripts/bufexplorer.zip.git'
" Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/tpope/vim-sleuth.git'
call plug#end()

" Plugin key mappings {
" Key mappings for any plugin functionality goes here

" The NERD tree
"nnoremap <C-n> :NERDTreeToggle<CR>

" better-whitespace
"nnoremap <F9> :StripWhitespace<CR>

" Tagbar
" sudo apt install exuberant-ctags
"nmap <F8> :TagbarToggle<CR>
" }
