call plug#begin()

" Styles
Plug 'https://github.com/scwood/vim-hybrid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigation & Fuzzy & Search
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'uplus/deoplete-solargraph'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Modes
Plug 'https://github.com/mhinz/vim-startify.git'
Plug 'https://github.com/diepm/vim-rest-console.git'
Plug 'https://github.com/tpope/vim-dispatch.git'
Plug 'https://github.com/skalnik/vim-vroom.git' 

" Text flow
Plug 'https://github.com/tpope/vim-endwise.git' 
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'mattn/emmet-vim'
" Plug 'brooth/far.vim'

" Linters
Plug 'https://github.com/rainerborene/vim-reek.git'
Plug 'https://github.com/ngmy/vim-rubocop.git'

" Plug 'junegunn/goyo.vim'
" Plug 'shime/vim-livedown'

" Languages
Plug 'https://github.com/tpope/vim-rails.git' 
Plug 'https://github.com/slim-template/vim-slim.git'
Plug 'https://github.com/thoughtbot/vim-rspec.git'
Plug 'pangloss/vim-javascript'
" Plug 'https://github.com/othree/html5.vim.git'
" Plug 'https://github.com/vim-ruby/vim-ruby.git'
" Plug 'tomlion/vim-solidity'
Plug 'maxmellon/vim-jsx-pretty'

" Autocomplete with snippets
" Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
call plug#end()

" NERDtree
let NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:NERDTreeWinSize=30
nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" YouCompleteMe
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

" Ultisnips better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" CTRL-P
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_map = '<c-p>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>
" set wildignore+=*/tmp/*,*/node_modules/*,*.git/,*/uploads/*,*/public/*,*/vendor/*
" let g:ctrlp_max_height = 7
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^tmp\cache\|system\|public\'

" FZF
map <c-p> :FZF<cr>

" Surround
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" Airline
" let g:airline_theme='hybrid'
let g:airline_theme='lucius'

" Vroom 
" let g:vroom_use_bundle_exec = 1
" let g:vroom_use_spring = 1
" let g:vroom_use_bundle_exec = 1
" let g:vroom_detect_spec_helper = 1

" Reek 
let g:reek_always_show = 0
let g:reek_on_loading = 0
let g:EasyGrepCommand=1
let g:EasyGrepPerlStyle=1

" VRC
set ma
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_elasticsearch_support = 1

" Emmet
let g:user_emmet_leader_key='<c-y>'
let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx' }}

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" let g:deoplete#sources = {}
" let g:deoplete#sources.javascript = ['ternjs']
" let g:deoplete#sources#solargraph#command = ''
" let g:deoplete#sources#flow#flow_bin = 'flow' 
" call deoplete#enable()

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
