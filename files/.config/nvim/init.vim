 call plug#begin()
  Plug 'https://github.com/tpope/vim-fugitive.git'
  " Plug 'https://github.com/phanviet/vim-monokai-pro.git'
  Plug 'https://github.com/arzg/vim-colors-xcode.git'
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

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'https://github.com/autozimu/LanguageClient-neovim.git', { 'branch': 'next', 'do': 'bash install.sh' }
call plug#end()

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

syntax sync fromstart

source ~/.config/nvim/core.vim
source ~/.config/nvim/hotkeys.vim

let g:UltiSnipsExpandTrigger="<c-j>"

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" set t_Co=256
set termguicolors
" colorscheme xcodedarkhc
colorscheme spring-night

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

let g:LanguageClient_serverCommands = {}
let g:LanguageClient_useFloatingHover=1
let g:LanguageClient_hoverPreview='Always'
let g:LanguageClient_autoStart = 0
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascriptreact': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'ruby': ['Gemfile', '.ruby-version'],
    \ 'javascript': ['jsconfig.json', 'node_modules'],
    \ 'typescript': ['tsconfig.json'],
    \ }

let g:LanguageClient_diagnosticsDisplay = {
      \   1: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   2: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   3: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   4: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>

call deoplete#custom#option({
\ 'auto_complete_delay': 100,
\ 'ignore_case': 1,
\ 'max_list': 15
\ })

let g:deoplete#enable_at_startup = 1

au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))