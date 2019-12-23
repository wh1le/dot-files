" NERDTree

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
" let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinSize=40

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeHighlightCursorline = 0

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
noremap <silent> - :call FZFInCurrentDirectory()<CR>

function! FZFInCurrentDirectory()
  let l:current_path_array = split(@%, '/')
  let l:current_path = ''

  if len(l:current_path_array) > 1
    let l:current_path = '^' . join(l:current_path_array[0:-2], '/')
  endif

  startinsert
  call feedkeys(":FZF \<CR>". l:current_path)
  stopinsert
endfunction
