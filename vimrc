filetype plugin indent on
syntax on

let mapleader = ","

map <C-m> <Esc>:w<CR>:!octave %<CR>
map <C-o> <Esc>:open 

map <C-t> <Esc>:tabnew<CR>
map <C-w> <Esc>:tabclose<CR>

map <C-l> <Esc>:tabn<CR>
map <C-h> <Esc>:tabp<CR>

nmap <tab><tab> <F5>

imap kj <Esc>
imap jk <Esc>
imap jj <Esc>

nnoremap ; :
nnoremap <tab> %
vnoremap <tab> %

nnoremap MM <Esc>:w<CR>:!lualatex %<CR>

nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V
nmap <leader>= :TagbarToggle<CR>

set grepprg=grep\ -nH\ $*
set noswapfile
set number autoindent hidden ruler relativenumber 
set ignorecase smartcase
set incsearch showmatch hlsearch
set tabstop=4
set shiftwidth=4
let g:tex_flavor = "pdflatex"
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_UseMakefile=1
let g:Tex_DefaultTargetFormat='pdf'
let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/.slime_paste"
let g:tagbar_autofocus = 1

au FileType haskell nnoremap <buffer> <leader>1 :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <leader>2 :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <leader>3 :HdevtoolsInfo<CR>

au FocusLost * :wa

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>
