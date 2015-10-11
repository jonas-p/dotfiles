set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'altercation/vim-colors-solarized'
    Plugin 'bling/vim-airline'
    Plugin 'junegunn/goyo.vim'
    Plugin 'kien/ctrlp.vim'
    Plugin 'reedes/vim-pencil'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'

    " languages
    Plugin 'groenewege/vim-less'
    Plugin 'jcf/vim-latex'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'jnwhiteh/vim-golang'
    Plugin 'rust-lang/rust.vim'
call vundle#end()

" change mapleader to ,
let mapleader=","

" quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" switching buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" remappings swedish keyboard layout
nnoremap å <C-]>

set encoding=utf8
set guioptions-=T "remove toolbar

set hidden
set confirm

set foldmethod=syntax
set spelllang=sv
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set expandtab
set hlsearch
set incsearch
set cursorline

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set showcmd

set nobackup
set noswapfile
set autoread
set mouse=a

" Disable Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set background=dark
set t_Co=256 " gnome-terminal override

map <C-b> :NERDTreeToggle<CR>

set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
let g:airline_section_y = airline#section#create(['%p', '%%'])
let g:airline_section_z = airline#section#create_right(['%l', '%c'])
"let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '|'

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nnoremap <leader>b :CtrlPBuffer<CR>

" Easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype indent plugin on
if has('autocmd')
	autocmd filetype python set expandtab
	autocmd filetype javascript set shiftwidth=2
endif

if &t_Co >= 256 || has("gui_running")
	colorscheme solarized
	set background=light
endif

if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Jump to previous/next fold
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
