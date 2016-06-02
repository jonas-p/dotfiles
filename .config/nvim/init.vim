if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end

let g:airline_powerline_fonts=1

call plug#begin('~/.config/nvim/plugged')
  " Editing
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-fugitive'
  Plug 'easymotion/vim-easymotion'

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Fuzzy file finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
  Plug 'junegunn/fzf.vim'

  " Languages
  Plug 'fatih/vim-go'
  Plug 'keith/swift.vim'
call plug#end()

" enable indent
filetype plugin indent on
set autoindent
set smartindent
" disable folding
set nofoldenable
" use spaces instead of tabs
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab 
" show incomplete commands
set showcmd
" show cursor position
set ruler
" do not create comment leader on enter
set formatoptions-=r
" show current line
set cursorline
" jump back and forth to matching bracket
set showmatch
" allow hidden unsaved buffers
set hidden 
" show relative line numbers
set relativenumber 
" show column at 80
"set colorcolumn=80

" UI stuff
set background=dark

let g:molotov=1
colorscheme molotov

" Keybindings
let mapleader = ","
nmap <Leader>ev :edit ~/.config/nvim/init.vim<CR>
nmap <Leader>sv :source ~/.config/nvim/init.vim<CR>
nmap <Leader>h :nohl<CR>
inoremap jk <Esc>

" Commands
command Bd bp\|bd \#

" Plugins

map <Leader> <Plug>(easymotion-prefix)

nmap \f :Files<CR>
nmap \b :Buffers<CR>
nmap \c :Colors<CR>

let g:UltiSnipsListSnippets = "<c-l>"

" Languages
let g:go_fmt_command = "goimports"
