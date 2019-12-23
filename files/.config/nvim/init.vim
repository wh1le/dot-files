call plug#begin()
  
  " Main
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'shime/vim-livedown', { 'for': 'markdown' }
 
  " Layout
  Plug 'chriskempson/base16-vim'
  Plug 'https://github.com/Yggdroot/indentLine.git'

  " Intelegence
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'https://github.com/majutsushi/tagbar.git'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Helpers
  Plug 'https://github.com/tpope/vim-endwise.git' 
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'https://github.com/tpope/vim-repeat.git'
  Plug 'tomtom/tcomment_vim'

  " Ruby Stack
  Plug 'https://github.com/slim-template/vim-slim.git', { 'for': 'slim' }
  Plug 'https://github.com/janko/vim-test.git', { 'for': ['ruby', 'ruby.spec'] }
  Plug 'https://github.com/keith/rspec.vim.git', { 'for': 'ruby.spec' }
  Plug 'https://github.com/tpope/vim-dispatch.git', { 'for': 'ruby' }

  " Javascript
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
  Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }

  " Navigation
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'https://github.com/ryanoasis/vim-devicons.git'
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug '/usr/local/opt/fzf'
  Plug 'dyng/ctrlsf.vim'

call plug#end()

source ~/.config/nvim/core.vim
source ~/.config/nvim/hotkeys.vim

colorscheme base16-default-dark

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]