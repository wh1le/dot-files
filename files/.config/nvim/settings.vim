colorscheme base16-default-dark
let base16colorspace=256
syntax on
filetype indent plugin on
set numberwidth=3
set history=500
set number
set nowrap
set cursorline
set noreadonly
set relativenumber
set autoread 
set so=8 " Set 7 lines to the cursor - when moving vertically using j/k
set langmenu=en
set wildmenu
set ruler
set cmdheight=1
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500
set foldcolumn=0 " Add a bit extra margin to the left
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
set nobackup
set nowb
set noswapfile
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftwidth=2 " 1 tab == 2 spaces
set tabstop=2
set linebreak
set textwidth=500 " Linebreak on 500 characters
set ai "Auto indent
set si "Smart indent
set showtabline=1
set laststatus=2

try " Specify the behavior when switching between buffers 
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif
