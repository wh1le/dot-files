if has("autocmd")
  " Make VIM remember position in file after reopen
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  autocmd VimResized * execute "normal! \<c-w>="
endif

