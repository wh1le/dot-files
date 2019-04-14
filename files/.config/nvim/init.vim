let mapleader=","
let g:mapleader=","

source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/helpers.vim
source ~/.config/nvim/hotkeys.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim

" nmap <buffer> <expr> - g:NERDTreeFind
let g:NERDTreeMinimalUI=1
noremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
