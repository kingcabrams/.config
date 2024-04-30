syntax on
set ai
set number
set tabstop=2
set shiftwidth=2
set relativenumber
set hlsearch
nnoremap <CR> :noh<CR><CR>
set backspace=indent,eol,start

noremap <F10> <ESC> :w <CR> :!clang++ -std=c++20 -Wall -Wextra -Wshadow -O2 -o %< % && ./%< < inp<CR>

nnoremap("J", ":m '>+1<CR>gv=gv")
nnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<C-u>" "<C-u>zz")
nnoremap("<C-d>" "<C-d>zz")

nnoremap("n" "nzzzv")
nnoremap("N" "Nzzzv")

highlight Comment ctermfg=green

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme gruvbox

