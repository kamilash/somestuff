syntax on
set is ic scs magic "Opções de Busca
set history=1000 "Grava as últimas linhas do código
set ai "Identação automática
set sm "Par de parênteses
set ts=4 "Seta aonde o tab para
set sw=4 "Número de colunas para ShiftWidth
"set expandtab "Tab vira espaço"
set et "Espaços no lugar de tabulação
retab "Converte em espaços
set showcmd "Mostra comandos incompletos
set nocp
set hlsearch
filetype plugin on
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                            \ exe "normal g'\"" | endif
:match Error /\t/

"Move faster when screen is splitted
map <C-DOWN> <C-w><DOWN>
map <C-UP> <C-w><UP>
map <C-LEFT> <C-w><LEFT>
map <C-RIGHT> <C-w><RIGHT>

"Fast Tab navigation 
nnoremap <C-S-left> :tabprevious<CR>
nnoremap <C-S-right>   :tabnext<CR>
inoremap <C-S-left> <Esc>:tabprevious<CR>
inoremap <C-S-right>   <Esc>:tabnext<CR>

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

set spell
hi clear SpellBad
hi SpellBad cterm=underline
set tags+=/home/kamila/.vim/ctags/system
set tags+=/home/kamila/.vim/ctags/embedded-dev-environment
