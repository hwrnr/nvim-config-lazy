"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/hawerner/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
let s:dein_dir = expand('~/.vim/bundles')
let g:rc_dir = expand('~/.vim/rc/')
let s:toml = g:rc_dir . 'dein.toml'
let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

    call dein#load_toml(s:toml, {'lazy':0})
    call dein#load_toml(s:lazy_toml, {'lazy':1})

  call dein#end()
    call dein#save_state()
endif

set termguicolors
set background=dark

colorscheme gruvbox

" Required:
filetype plugin indent on
syntax enable

set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

set number relativenumber
set cursorline
set mouse=a

map <Space>bn :bnext<CR>
map <Space>bp :bprevious<CR>
map <Space>bc :bdelete<CR>

" Splits
nnoremap sg :vsplit<CR>
nnoremap sh :split<CR>

" Move between splits
nnoremap <Space>j <C-W><C-J>
nnoremap <Space>k <C-W><C-K>
nnoremap <Space>l <C-W><C-L>
nnoremap <Space>h <C-W><C-H>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>


set nowrap

"End dein Scripts-------------------------e
