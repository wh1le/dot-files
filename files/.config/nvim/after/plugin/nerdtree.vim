if exists(":NERDTree")
  let NERDTreeWinPos = "right"
  let NERDTreeShowHidden=0
  let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
  let g:NERDTreeNodeDelimiter = "\u00a0"
  let g:NERDTreeWinSize=40

  nmap <C-\> :NERDTreeFind<CR>
  nmap <silent> <leader><leader> :NERDTreeToggle<CR>
  let g:NERDTreeMinimalUI=1

  noremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
endif
