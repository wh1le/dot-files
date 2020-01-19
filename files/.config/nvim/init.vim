call plug#begin()
  " UI
  Plug 'https://github.com/chriskempson/base16-vim.git'
  Plug 'https://github.com/Lokaltog/vim-monotone.git'
  Plug 'git://github.com/Yggdroot/indentLine.git'

  " Helpers
  Plug 'git://github.com/tpope/vim-surround.git'
  Plug 'git://github.com/tpope/vim-endwise.git'
  Plug 'tomtom/tcomment_vim'

  " Ruby Stack
  Plug 'https://github.com/slim-template/vim-slim.git', { 'for': 'slim' }
  Plug 'https://github.com/janko/vim-test.git', { 'for': ['ruby', 'ruby.spec'] }
  Plug 'https://github.com/tpope/vim-rails.git'

  " Javascript
  " Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  " Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
  " Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }

  " Navigation
  Plug 'scrooloose/nerdtree'
  Plug '/usr/local/opt/fzf'
  Plug 'dyng/ctrlsf.vim'
  Plug 'universal-ctags/ctags'

  " Intelegence
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
call plug#end()

source ~/.config/nvim/core.vim
source ~/.config/nvim/hotkeys.vim

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

colorscheme base16-default-dark


hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=none gui=NONE guifg=DarkGrey guibg=NONE
hi StatusLine ctermbg=18 ctermfg=Grey

set regexpengine=1
set ttyfast
set lazyredraw