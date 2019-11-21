source ~/.config/nvim/hotkeys.vim

" General
set clipboard=unnamedplus
set mouse=a
set foldlevel=99
set noswapfile
set encoding=UTF-8
set history=2000
set ffs=mac,unix
set fileformat=unix
set noendofline binary
set laststatus=2
set nowrap
set noreadonly
set hidden
set ignorecase
set whichwrap+=<,>,h,l
set smartcase
set lazyredraw " Don't redraw while executing macros (good performance config)
set noerrorbells " No annoying sound on errors
set novisualbell
set timeoutlen=500
set nobackup
set expandtab " Use spaces instead of tabs
set shiftwidth=2 " 1 tab == 2 spaces
set tabstop=2
set smartindent
set nocursorcolumn
set nocursorline
set hlsearch " Highlight search results
" TUI
set number relativenumber
set numberwidth=4
set showtabline=0
set so=8
set showmatch " Show matching brackets when text indicator is over them
" Colors
let base16colorspace=256
syntax sync minlines=256
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
highlight Comment cterm=italic gui=italic

call plug#begin()
  " Main
  Plug 'chriskempson/base16-vim'
  Plug 'https://github.com/Yggdroot/indentLine.git'
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', { 'do': 'brew instsall fzf ag' }
  Plug 'https://github.com/majutsushi/tagbar.git'
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/goyo.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'https://github.com/ryanoasis/vim-devicons.git'

  " Helpers
  Plug 'https://github.com/tpope/vim-endwise.git' 
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'https://github.com/tpope/vim-repeat.git'
  Plug 'tomtom/tcomment_vim'
  Plug 'mattn/emmet-vim', { 'for': ['html', 'erb'] }
  Plug 'shime/vim-livedown', { 'for': 'markdown' }

  " Ruby
  Plug 'https://github.com/tpope/vim-rails.git', { 'for': 'ruby' }
  Plug 'https://github.com/slim-template/vim-slim.git', { 'for': 'slim' }
  Plug 'https://github.com/janko/vim-test.git', { 'for': ['ruby', 'ruby.spec'] }
  Plug 'https://github.com/tpope/vim-dispatch.git', { 'for': 'ruby' }

  " Javascript
  Plug 'https://github.com/elzr/vim-json.git', { 'for': 'json' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
  Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }
call plug#end()

hi Function cterm=bold
filetype indent plugin on
set foldmethod=indent
colorscheme base16-default-dark
syntax on