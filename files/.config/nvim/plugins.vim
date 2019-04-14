call plug#begin()

" Displaying
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/mhinz/vim-startify.git'

" File Navigation and search
Plug 'mileszs/ack.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'junegunn/fzf'

" Fancy integrations
Plug 'shime/vim-livedown'
Plug 'https://github.com/aquach/vim-http-client.git'
Plug 'https://github.com/tpope/vim-dispatch.git'
Plug 'https://github.com/skalnik/vim-vroom.git' 
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'

" Completion & Snippet
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Code flow
Plug 'https://github.com/tpope/vim-endwise.git' 
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'mattn/emmet-vim'

" Languages
Plug 'https://github.com/tpope/vim-rails.git' 
Plug 'https://github.com/slim-template/vim-slim.git'
Plug 'https://github.com/thoughtbot/vim-rspec.git'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
call plug#end()

" Snipets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NERDtree
let NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:NERDTreeWinSize=40
nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" FZF
map <c-p> :FZF<cr>

" Surround
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" Airline
let g:airline_theme='base16'

" VRC
set ma
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_elasticsearch_support = 1

" Emmet
let g:user_emmet_leader_key='<c-y>'
let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx' }}

" Ack
let g:ackhighlight = 1

" VRoom
let g:vroom_map_keys = 0
" tmux with dispatch plugin
" run test with seus, if zues not active, switches to bundle exec
let g:vroom_use_seus = 1
let g:vroom_use_colors = 1
" let g:vroom_use_dispatch = 1
map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>

" jump to test file
map <leader>t :A<CR>

" Ale
let b:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'css': ['prettier'],
  \ 'ruby': ['rubocop'],
  \ }

let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ }

" let g:ale_sign_warning = '▲'
" let g:ale_sign_error = '>'
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_virtualenv_dir_names = []

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
highlight clear DimGray
highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1

" Fugitive
let g:airline#extensions#branch#enabled = 1

let $FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'

" Deoplete with tern
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 0
let g:deoplete#sources#ternjs#tern_bin =  "/Users/nikitamiloserdov/.nvm/versions/node/v11.14.0/bin/tern"
let g:deoplete#sources#ternjs#filetypes = ['jsx']
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 100)
" Whether to include JavaScript keywords when completing something that is not a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1
