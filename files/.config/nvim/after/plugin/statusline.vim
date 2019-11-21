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
    return " [👾]"
  endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return '[🔒]'
  else
    return ''
endfunction

set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=%{ReadOnly()} 
set statusline+=%{PasteForStatusline()}
set statusline+=\%*
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
