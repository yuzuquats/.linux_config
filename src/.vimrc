set nocompatible
filetype off
let s:darwin = has('mac')
" VimPlug
" call :PlugInstall

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'amix/vim-zenroom2'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'

" React/Javascript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Auto Complete

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --gocode-completer
  endif 
endfunction 
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }

call plug#end()

" Aliases

nmap :minitab :set expandtab tabstop=2 shiftwidth=2 softtabstop=2
nmap :normtab :set expandtab tabstop=4 shiftwidth=4 softtabstop=4

nmap :nt :NERDTreeToggle
nmap :Q :q
nmap :Wq :wq
nmap :W :w

nmap <S-Up> :lprev<CR>
nmap <S-Down> :lnext<CR>
nmap :mm :lnext
nmap :gy :Goyo
nmap :Gy :Goyo
nmap :ll :Limelight
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Themes

syntax on
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

hi Visual ctermbg=Grey
hi Comment ctermfg=Grey guifg=Grey

" NerdTree

let NERDTreeShowHidden=1

" tmux

if &term =~ '^screen'
  "tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

set backspace=indent,eol,start

" Airline

let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

set nocompatible
set laststatus=2
set encoding=utf-8
set termencoding=utf-8
set mouse=a

" Ctrl- P

let g:ctrlp_map = '<c-p>'

hi CtrlPMatch ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc cterm=NONE gui=NONE

" Git Gutter

highlight SignColumn            ctermbg=8

highlight GitGutterAdd          ctermbg=236
highlight GitGutterChange       ctermbg=236
highlight GitGutterDelete       ctermbg=236
highlight GitGutterChangeDelete ctermbg=236

" Goyo

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z

  set noshowmode
  set noshowcmd
  set scrolloff=999
  set background=light
  hi Visual ctermbg=152 guibg=#B2DFE0
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif

  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux
  resize-pane -Z

  set showmode
  set showcmd
  set scrolloff=5
  set background=dark
  hi Visual ctermbg=DarkGrey
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight

let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.3

" Misc

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set visualbell
set mouse=a
set colorcolumn=80
