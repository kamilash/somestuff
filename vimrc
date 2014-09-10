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
set t_Co=256

set spell                       " check spell is right
highlight clear SpellBad        " clear highlight background to this group and sets underline
highlight SpellBad cterm=underline 

:match Error /\t/               " highlights tabs, when see it use :retab 

" Jump back to last line when re-opening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                            \ exe "normal g'\"" | endif

" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Vundle Install
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'    " shows directories tree
Plugin 'scrooloose/syntastic'   " syntax checking
Plugin 'bling/vim-airline'      " gay stuff

call vundle#end() " required

"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" vim-airline
if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_enable_branch = 1
    let g:airline_enable_syntastic = 1
    let g:airline_powerline_fonts = 1
endif

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
