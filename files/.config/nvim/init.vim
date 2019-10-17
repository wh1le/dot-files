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
  " UI
  Plug 'chriskempson/base16-vim'
  Plug 'https://github.com/Yggdroot/indentLine.git'

  " Navigation
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', { 'do': 'brew instsall fzf ag' }
  Plug 'https://github.com/majutsushi/tagbar.git'

  " Git
  Plug 'tpope/vim-fugitive'

  " Planning and managment
  Plug 'vimwiki/vimwiki'

  Plug 'junegunn/goyo.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Completion & Langugage Client
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'https://github.com/autozimu/LanguageClient-neovim.git', { 'branch': 'next', 'do': 'bash install.sh' }

  " Helpers
  Plug 'https://github.com/tpope/vim-endwise.git' 
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'https://github.com/tpope/vim-repeat.git'
  Plug 'tomtom/tcomment_vim'

  Plug 'mattn/emmet-vim', { 'for': 'html' }
  Plug 'shime/vim-livedown', { 'for': 'markdown' }

  " Ruby
  Plug 'https://github.com/tpope/vim-rails.git', { 'for': 'ruby' }
  Plug 'https://github.com/slim-template/vim-slim.git', { 'for': 'slim' }
  Plug 'thoughtbot/vim-rspec'
  Plug 'https://github.com/tpope/vim-dispatch.git', { 'for': 'ruby' }

  " Javascript
  Plug 'https://github.com/elzr/vim-json.git', { 'for': 'json' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
  Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }
call plug#end()

colorscheme base16-default-dark
set foldmethod=indent

" Deoplete
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" let g:deoplete#enable_at_startup = 1

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{'path': '~/vimwiki/'}]
nmap <leader>tt <Plug>VimwikiToggleListItem
nmap <Leader>wf <Plug>VimwikiFollowLink
nmap <Leader>wq <Plug>VimwikiVSplitLink

let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('file', 'rank', 2000)
call deoplete#custom#source('ultisnips', 'rank', 1000)
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

" LanguageClient

let g:LanguageClient_serverCommands = {}
let g:LanguageClient_useFloatingHover=1
let g:LanguageClient_hoverPreview='Always'

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

let g:LanguageClient_diagnosticsDisplay = {
      \   1: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   2: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   3: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \   4: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
      \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

filetype indent plugin on
syntax on

" Prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcomment_mapleader1=''
let g:tcomment_mapleader2=''
let g:tcomment_mapleader_comment_anyway=''
let g:tcomment_textobject_inlinecomment=''

" The default (g<) is a bit awkward to type.
let g:tcomment_mapleader_uncomment_anyway='gu'

" let g:indentLine_char_list = ['¦', '┊']
let g:indentLine_char_list = ['·']
let g:indentLine_enabled = 1

hi Function cterm=bold

set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=%{ReadOnly()} 
set statusline+=%{PasteForStatusline()}
set statusline+=\ %*
set statusline+=%#keyword#\ %f
set statusline+=\ %*
set statusline+=\ ‹‹\ %*
set statusline+=%{FugitiveHead()}
set statusline+=\ ››\ %*
set statusline+=%=

set statusline+=\ ‹‹
set statusline+=\ %*
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

function! StatuslineMode()
  return ""
  " let l:mode=mode()
  " if l:mode==#"n"
  "   return "[NORMAL]"
  " elseif l:mode==?"v"
  "   return "[VISUAL]"
  " elseif l:mode==#"i"
  "   return "[INSERT]"
  " elseif l:mode==#"R"
  "   return "[REPLACE]"
  " elseif l:mode==?"s"
  "   return "[SELECT]"
  " elseif l:mode==#"t"
  "   return "[TERMINAL]"
  " elseif l:mode==#"c"
  "   return "[COMMAND]"
  " elseif l:mode==#"!"
  "   return "[SHELL]"
  " endif
endfunction

function! PasteForStatusline()
  let l:paste_status = &paste
  if l:paste_status == 1
    return " [🧷]"
  else
    return ""
  endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return '[🔒]'
  else
    return ''
  endfunction

