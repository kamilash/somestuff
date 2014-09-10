syntax on                     " turns syntax highlighting on
set nocompatible              " (cp) use Vim defaults
set incsearch                 " (is) highlights what you are searching for as you type
set hlsearch                  " (hls) highlights all instances of the last searched string
set ignorecase                " (ic) ignores case in search patterns
set smartcase                 " (scs) don't ignore case when the search pattern has uppercase
set magic                     " to use different patterns
set history=1000              " saves last lines
set autoindent
set showmatch                 " (sm) show matching braces
set tabstop=4
set shiftwidth=4              " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set expandtab                 " (et) converting tabs to spaces, use :retab to redo entire file
set showcmd                   " (sc) display an incomplete command in the lower right
set noswapfile                " (swf) disables swapfiles

set spell                     " check spell is right
highlight clear SpellBad      " clear highlight background to this group and sets underline
highlight SpellBad cterm=underline 

:match Error /\t/             " highlights tabs, when see it use :retab 

" jump back to last line when re-opening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                            \ exe "normal g'\"" | endif

" filetype stuff
filetype on
filetype plugin on
filetype indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Move faster when screen is splitted
map <C-DOWN> <C-w><DOWN>
map <C-UP> <C-w><UP>
map <C-LEFT> <C-w><LEFT>
map <C-RIGHT> <C-w><RIGHT>

"Fast Tab navigation
nnoremap <C-S-left> :tabprevious<CR>
nnoremap <C-S-right> :tabnext<CR>
inoremap <C-S-left> <Esc>:tabprevious<CR>
inoremap <C-S-right> <Esc>:tabnext<CR>

"Fast building with tests ;-)
nnoremap <C-b> :!make check<CR>

"nnoremap <C-S-n> :tn<CR>
"nnoremap <C-S-p> :tp<CR>
"inoremap <C-S-n> <Esc>:tn<CR>
"inoremap <C-S-p> <Esc>:tp<CR>

autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
set tags+=~/.vim/ctags/system
set tags+=~/.vim/ctags/embedded-dev-environment

set tags+=/home/kamila/.vim/ctags/system
set tags+=/home/kamila/.vim/ctags/embedded-dev-environment

