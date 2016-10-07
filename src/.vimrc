set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" vim :BundleInstall
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
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/mru.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

call vundle#end()
filetype plugin indent on

" Misc

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set number
set visualbell

" Aliases

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
set t_Co=256
set term=xterm-256color
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
