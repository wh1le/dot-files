call plug#begin()
  Plug 'dyng/ctrlsf.vim'
  " Main
  Plug 'chriskempson/base16-vim'
  Plug 'https://github.com/Yggdroot/indentLine.git'
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', { 'do': 'brew instsall fzf ag' }
  Plug 'https://github.com/majutsushi/tagbar.git'
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
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
  " Plug 'https://github.com/elzr/vim-json.git', { 'for': 'json' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
  Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }
call plug#end()

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


hi Function cterm=bold
filetype indent plugin on
set foldmethod=indent
colorscheme base16-default-dark
syntax on


" FZF
let $FZF_DEFAULT_OPTS="--height 20% --ansi --layout=reverse --preview-window 'right:60%' --preview 'bat --color=always --style='changes' --theme='base16' {}'"
let g:fzf_layout = { 'window': 'enew' }
map <c-p> :FZF<cr>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

nmap <leader>tt <Plug>VimwikiToggleListItem
nmap <Leader>wf <Plug>VimwikiFollowLink
nmap <Leader>wq <Plug>VimwikiVSplitLink

" Vim Test

map <silent> <leader>s :TestNearest<CR>
map <silent> <leader>t :TestFile<CR>

" CtrlSF
nnoremap <leader>g :CtrlSF 

let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_context = '-B 1 -A 2'
" let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_winsize = '45%'

let NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinSize=40

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI=1
noremap <silent> - :call FZFInCurrentDirectory()<CR>

function! FZFInCurrentDirectory()
  let l:current_path_array = split(@%, '/')
  let l:current_path = ''

  if len(l:current_path_array) > 1
    let l:current_path = '^' . join(l:current_path_array[0:-2], '/')
  endif

  startinsert
  call feedkeys(":FZF \<CR>". l:current_path)
  stopinsert
endfunction