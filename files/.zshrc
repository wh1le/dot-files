typeset -A __NIKITA

fpath=($HOME/.zsh/completions $fpath)

autoload -U compinit
compinit -u

# Make completion:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'

# $CDPATH is overpowered (can allow us to jump to 100s of directories) so tends
# to dominate completion; exclude path-directories from the tag-order so that
# they will only be used as a fallback if no completions are found.
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# Categorize completion suggestions with headings:
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %F{default}%B%{$__WINCENT[ITALIC_ON]%}--- %d ---%{$__WINCENT[ITALIC_OFF]%}%b

autoload -U colors
colors

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git hg
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
# zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
# zstyle ':vcs_info:*' use-simple true
# zstyle ':vcs_info:git+set-message:*' hooks git-untracked
# zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
# zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
# zstyle ':vcs_info:hg*:*' formats '[%m%b] '
# zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
# zstyle ':vcs_info:hg*:*' branchformat '%b'
# zstyle ':vcs_info:hg*:*' get-bookmarks true
# zstyle ':vcs_info:hg*:*' get-revision true
# zstyle ':vcs_info:hg*:*' get-mq false
# zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
# zstyle ':vcs_info:hg*+set-message:*' hooks hg-message

# function +vi-hg-bookmarks() {
#   emulate -L zsh
#   if [[ -n "${hook_com[hg-active-bookmark]}" ]]; then
#     hook_com[hg-bookmark-string]="${(Mj:,:)@}"
#     ret=1
#   fi
# }

# function +vi-hg-message() {
#   emulate -L zsh

#   # Suppress hg branch display if we can display a bookmark instead.
#   if [[ -n "${hook_com[misc]}" ]]; then
#     hook_com[branch]=''
#   fi
#   return 0
# }

# function +vi-git-untracked() {
#   emulate -L zsh
#   if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
#     hook_com[unstaged]+="%F{blue}●%f"
#   fi
# }

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

RPROMPT_BASE="\${vcs_info_msg_0_}%F{blue}%~%f"
setopt PROMPT_SUBST

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# configuration based on 
# https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.zsh

source $HOME/.zsh/colors
source $HOME/.zsh/aliases
source $HOME/.zsh/path
source $HOME/.zsh/exports
source $HOME/.zsh/common
source $HOME/.zsh/functions

export ZSH="/Users/nikitamiloserdov/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=( git)


if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
fi

source $ZSH/oh-my-zsh.sh
