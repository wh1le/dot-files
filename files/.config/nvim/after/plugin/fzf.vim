let $FZF_DEFAULT_OPTS="--height 20% --ansi --layout=reverse --preview-window 'right:60%' --preview 'bat --color=always --style='changes' --theme='base16' {}'"

let g:fzf_layout = { 'window': 'enew' }

map <c-p> :FZF<cr>
