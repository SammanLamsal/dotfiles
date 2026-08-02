# Use XDG dirs for completion and history files
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# Use modern completion system
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# Keep 5000 lines of history within the shell
HISTSIZE=5000
SAVEHIST=5000

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

if [ -f "$HOME/env_vars.sh" ]; then
    . "$HOME/env_vars.sh"
fi

FD_OPTIONS="-H --follow --exclude .git --exclude node_modules"
source <(fzf --zsh)

ff() {
  local file
  file=$(eval fd $FD_OPTIONS | fzf) || return
  [ -n "$file" ] && nvim "$file"
}

ffp() {
  local file
  file=$(eval fd $FD_OPTIONS | fzf --preview="bat --color=always {}") || return
  [ -n "$file" ] && nvim "$file"
}

cdf() {
  local dir
  dir=$(eval fd -t d $FD_OPTIONS | fzf) || return
  [ -n "$dir" ] && cd "$dir"
}

alias vim="nvim"
alias nixreb="sudo nixos-rebuild switch --flake . --impure"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border top'
export COLORTERM=truecolor
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MANPAGER="nvim +Man!"
