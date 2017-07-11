let NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=30

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 1 
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_map = '<c-p>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

set wildignore+=*/tmp/*,*/node_modules/*,*.git/,*/uploads/*,*/public/*,*/vendor/*
let g:ctrlp_max_height = 7
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^tmp\cache\|system\|public\'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" let g:airline_powerline_fonts = 1
" let g:airline_theme='lucius'
let g:airline_theme = 'spring_night'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vroom 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vroom_use_bundle_exec = 1
let g:vroom_use_spring = 1
" let g:vroom_use_bundle_exec = 1
" let g:vroom_detect_spec_helper = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Reek 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:reek_always_show = 0
let g:reek_on_loading = 0

let g:EasyGrepCommand=1
let g:EasyGrepPerlStyle=1

