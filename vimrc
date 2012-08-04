set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'bufexplorer.zip'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tpope/vim-surround'
Bundle 'vcscommand.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tlib_vim'
Bundle "honza/snipmate-snippets"
Bundle "closetag.vim"


filetype plugin indent on 

set autoindent
set smartindent
set showmatch
set t_Co=256
set viminfo+=! 
set showmode
set showcmd
set mouse=a
set ruler
set background=dark
set scrolloff=2
set wrap
set linebreak
let mapleader = "," "got used to it

set incsearch
set hlsearch
set ignorecase
set smartcase

set backup
set backupdir=~/.vim/backup/
set ffs=unix,dos,mac

syntax on
filetype on
filetype plugin on

set backspace=2 " make backspace work like most other apps
set whichwrap+=<,>,h,l
set hid "hide abbadoned buffers
set shortmess=atI
set tabstop=4

"graphics
if has("gui_running")
  let g:Powerline_symbols = 'fancy'
  if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    set lsp=1 "blank spaces between lines
  elseif has("gui_macvim")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
    set lsp=0 "no blank spaces on display
  "elseif has("gui_win32")
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
  endif
endif
set guioptions-=T

let g:Powerline_stl_path_style='short'
"let g:Powerline_theme="skwp"

"tabs stuff
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set fileencodings=utf-8,cp1251,koi8-r,cp866

"filetype-specific settings"

"autocmd FileType mail set formatoptions+=t textwidth=72
autocmd FileType css set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType asm set shiftwidth=8
autocmd FileType html,xhtml,htm,htmldjango colorscheme django 
autocmd FileType python colorscheme molokai "rdark
autocmd BufRead settings.py colorscheme two2tango
autocmd BufRead settings_local.py colorscheme two2tango
autocmd BufRead settings_dev.py colorscheme two2tango
autocmd BufReadPost * call Pl#Load() "fix colorschemes in powerline
if has('gui_running')
        colorscheme slate
    else
        colorscheme crt
endif

set completeopt-=preview
set completeopt+=longest


if has("autocmd")
    " Change to the directory the file in your current buffer is in
    autocmd BufEnter * :cd %:p:h
endif " has("autocmd") 

let g:bufExplorerShowRelativePath=1
" Remappings for ukrainian keys"
  map ’ `
  map й q
  map ц w
  map у e
  map к r
  map е t
  map н y
  map г u
  map ш i
  map щ o
  map з p
  map х [
  map ї ]
  map ф a
  map і s
  map в d
  map а f
  map п g
  map р h
  map о j
  map л k
  map д l
  map ж ;
  map є '
  map я z
  map ч x
  map с c
  map м v
  map и b
  map т n
  map ь m
  map б ,
  map ю .
  map ' ~
  map Й Q
  map Ц W
  map У E
  map К R
  map Е T
  map Н Y
  map Г U
  map Ш I
  map Щ O
  map З P
  map Х {
  map Ї }
  map Ф A
  map І S
  map В D
  map А F
  map П G
  map Р H
  map О J
  map Л K
  map Д L
  map Ж :
  map Є "
  map Я Z
  map Ч X
  map С C
  map М V
  map И B
  map Т N
  map Ь M
  map Б <
  map Ю >

"Usual typos
command WQ wq
command Wq wq
command WA wa
command Wa wa
command W w
command Q q
command Vs vs

"hate long lines. Especially in python
map  :match ErrorMsg '\%>80v.\+'

"current date
nnoremap <F9> "=strftime("%c")<CR>P
inoremap <F9> <C-R>=strftime("%c")<CR>

"XML stuff
command Fixxml silent 1,$!xmllint --format --recover --encode utf8 - 2>/dev/null
au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

