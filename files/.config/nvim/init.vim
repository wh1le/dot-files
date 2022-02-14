call plug#begin()
  Plug 'https://github.com/chriskempson/base16-vim.git'
  Plug 'https://github.com/morhetz/gruvbox.git'
  Plug 'https://github.com/cocopon/iceberg.vim.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'https://github.com/rhysd/vim-color-spring-night.git'
  Plug 'git://github.com/Yggdroot/indentLine.git'
  Plug 'https://github.com/vimwiki/vimwiki.git'

  Plug 'git://github.com/tpope/vim-surround.git'
  Plug 'git://github.com/tpope/vim-endwise.git'
  Plug 'tomtom/tcomment_vim'

  Plug 'https://github.com/janko/vim-test.git', { 'for': ['ruby', 'ruby.spec'] }
  Plug 'https://github.com/tpope/vim-rails.git'

  " Hightliting
  Plug 'https://github.com/HerringtonDarkholme/yats.vim.git' " Typescript
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
  Plug 'slim-template/vim-slim'

  Plug 'scrooloose/nerdtree'
  Plug '/usr/local/opt/fzf'
  Plug 'dyng/ctrlsf.vim'
  Plug 'universal-ctags/ctags'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'https://github.com/jpalardy/vim-slime'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'git@github.com:jeetsukumaran/vim-buffergator.git'
call plug#end()

let g:perl_host_prog = '/usr/local/bin/perl'
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

syntax sync fromstart

source ~/.config/nvim/core.vim
source ~/.config/nvim/hotkeys.vim

let g:UltiSnipsExpandTrigger="<c-j>"

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" set t_Co=256
set termguicolors
" colorscheme iceberg
colorscheme gruvbox

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight NonText ctermbg=none

hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=none gui=NONE guifg=DarkGrey guibg=NONE
hi StatusLine ctermfg=DarkBlue
" hi Directory guifg=#FF0000 ctermfg=5

set nowrap
set linebreak

" Commented because of the vim typescript issues
" set regexpengine=1
" set ttyfast
" set nolazyredraw

" Disable statusline in nerdtree
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

let $TERM="tmux-256color"

vmap <C-c> "+y

au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

let g:buffergator_viewport_split_policy="B"
let g:buffergator_split_size="10"
let g:buffergator_display_regime="bufname"