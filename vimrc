set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"uncomment next if this config is not in default dir
"let &rtp = substitute(&rtp, '\.vim\>', '.meavim', 'g')
"
"if .vim dir is not on default location
"
"let &rtp = substitute(&rtp, '\.vim\>', '.meavim', 'g')

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/MatchTag'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'bufexplorer.zip'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'VOoM'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'greyblake/vim-preview'
Plugin 'yegappan/grep'
Plugin 'vim-auto-save'
Plugin 'w0rp/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'romainl/flattened'
Plugin 'morhetz/gruvbox'

call vundle#end()            " required

let g:PreviewBrowsers='chromium'



filetype plugin indent on 
"
"autocmd FileType mail set formatoptions+=t textwidth=72
autocmd FileType python,javascript,typescript nested colorscheme gruvbox "rdark
let g:molokai_original = 1

set autoindent
set smartindent
set showmatch
set t_Co=256
set viminfo+=! 
set showmode
set showcmd
set mouse=a
set ruler
set cursorline
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

set guioptions-=T


"tabs stuff
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set fileencodings=utf-8,cp1251,koi8-r,cp866

"filetype-specific settings"


set guifont=Menlo\ Regular:h14
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
command E e

"firefox style
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"hate long lines. Especially in python
map  :match ErrorMsg '\%>80v.\+'


nmap ,i :set foldmethod=indent<CR>
nmap ,m :set foldmethod=manual<CR>
nmap ,s :SyntasticToggleMode<CR>
nmap ,l :set spell spelllang=uk_ua<CR>

"current date
nnoremap <F9> "=strftime("%c")<CR>P
inoremap <F9> <C-R>=strftime("%c")<CR>

"swap parameters around equal sign
fu! SwapFunc()
    "s!\([^ =]*\)\([ ]*\)=[ ]*\([^;]*\);!\3 = \1;!<CR>:nohl<CR>
    s/\([^=]*\)\s\+=\s\+\([^;]*\)/\2 = \1
    "C style
    "s/^\s*\(.\{-}\)\s*=\s*\(.\{-}\)\s*;\s*$/\2 = \1;/
endfun
function LiveDown()
    !livedown start % --open --browser=chromium &
    AutoSaveToggle
endfunction


"XML stuff
command Fixxml silent 1,$!xmllint --format --recover --encode utf8 - 2>/dev/null
command Fixjson silent 1,$!python -m json.tool
command Livedown call LiveDown()
command Swapequal call SwapFunc()

let g:syntastic_javascript_checkers = ['jshint']

nnoremap <C-f> :Gitgrep <cword> :/ <CR>
