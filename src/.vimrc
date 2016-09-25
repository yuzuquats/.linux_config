set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kshenoy/vim-signature'
Plugin 'lifepillar/vim-solarized8'

syntax on

if &term =~ '^screen'
    "tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set backspace=indent,eol,start

let g:airline_powerline_fonts = 1
set nocompatible
set laststatus=2
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

set mouse=a

let g:ctrlp_map = '<c-p>'

hi CtrlPMatch ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc cterm=NONE gui=NONE

nmap :nt :NERDTreeToggle 
nmap :Q :q
nmap :Wq :wq
nmap :W :w

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set number

highlight SignColumn            ctermbg=8

highlight GitGutterAdd          ctermbg=236
highlight GitGutterChange       ctermbg=236
highlight GitGutterDelete       ctermbg=236
highlight GitGutterChangeDelete ctermbg=236

nmap <S-Up> :lprev<CR>
nmap <S-Down> :lnext<CR>
nmap :mm :lnext
