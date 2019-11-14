" let $FZF_DEFAULT_COMMAND='ag -g ""'
" let $FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
let $FZF_DEFAULT_OPTS="--height 20% --ansi --layout=reverse --preview-window 'right:60%' --preview 'bat --color=always --style='changes' --theme='base16' {}'"
let g:fzf_layout = { 'window': 'enew' }
" let $FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview='bar --theme=base16' '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

map <c-p> :FZF<cr>
