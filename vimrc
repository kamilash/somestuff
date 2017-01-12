syntax on                       " turns syntax highlighting on
colorscheme default
set nocompatible                " (cp) use Vim defaults
set incsearch                   " (is) highlights what you are searching for as you type
set hlsearch                    " (hls) highlights all instances of the last searched string
set ignorecase                  " (ic) ignores case in search patterns
set smartcase                   " (scs) don't ignore case when the search pattern has uppercase
set magic                       " to use different patterns
set history=1000                " saves last lines
set autoindent
set showmatch                   " (sm) show matching braces
set tabstop=4
set shiftwidth=4                " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set expandtab                   " (et) converting tabs to spaces, use :retab to redo entire file
set showcmd                     " (sc) display an incomplete command in the lower right
set noswapfile                  " (swf) disables swapfiles
"set t_Co=256

set spell                       " check spell is right
highlight clear SpellBad        " clear highlight background to this group and sets underline
highlight SpellBad cterm=underline 

" :match Error /\t/               " highlights tabs, when see it use :retab 

" Jump back to last line when re-opening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                            \ exe "normal g'\"" | endif

" Vundle Install
" Set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'    " shows directories tree
Plugin 'scrooloose/syntastic'   " language syntax checking
"Plugin 'bling/vim-airline'      " lean & mean status/tabline
"Plugin 'gcmt/wildfire.vim'      " quickly select the closest text object among a group of candidates
Plugin 'fatih/vim-go'
Plugin 'ap/vim-buftabline'

" Javascript plugins
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'

" Scala
Plugin 'derekwyatt/vim-scala'

call vundle#end() " required

" Had this problem on one of the dev envs: http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2 " make backspace work like most other apps

"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Move faster when screen is splitted
map <C-DOWN> <C-w><DOWN>
map <C-UP> <C-w><UP>
map <C-LEFT> <C-w><LEFT>
map <C-RIGHT> <C-w><RIGHT>

" Fast Tab navigation
nnoremap <C-S-left> :tabprevious<CR>
nnoremap <C-S-right> :tabnext<CR>
inoremap <C-S-left> <Esc>:tabprevious<CR>
inoremap <C-S-right> <Esc>:tabnext<CR>

" Fast building with tests ;-)
nnoremap <C-b> :!make check<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>

" Fast buffer navigation 
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>c :bd<CR>

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" Set all errors list to quickfix
let g:go_list_type = "quickfix"
"Enable colorfulness
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:rehash256 = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

"Some maps to vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" vim-airline
"if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
"    set laststatus=2
"    let g:airline#extensions#tabline#enabled = 1
"    let g:airline#extensions#tabline#fnamemod = ':t'
"    let g:airline_enable_branch = 1
"    let g:airline_enable_syntastic = 1
"    let g:airline_powerline_fonts = 1
"endif

" Syntastic Settings
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_enable_signs = 1
