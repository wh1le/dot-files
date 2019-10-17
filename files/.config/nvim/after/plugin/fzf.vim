let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

map <c-p> :FZF<cr>
