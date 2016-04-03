source ~/.vim/vimrc/plugins.vim
source ~/.vim/vimrc/basic.vim
source ~/.vim/vimrc/plugins_config.vim

autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]
set nowrap
let mapleader=","

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>
