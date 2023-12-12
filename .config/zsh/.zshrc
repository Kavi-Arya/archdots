# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Exports
export PATH=/opt/homebrew/bin/:$PATH
export PATH=/home/kvl/.local/bin/:$PATH
export PATH=/home/kvl/src/:$PATH
export PATH=/home/kvl/.nix-profile/bin/:$PATH
export PATH=/home/kvl/.local/share/cargo/bin/:$PATH
export PATH=/opt/homebrew/lib/python3.10/site-packages/:$PATH
export PATH=/usr/local/mysql/bin/:$PATH
export iCloud="/home/kvl/Library/Mobile Documents/com~apple~CloudDocs"
export mySql="/usr/local/mysql/bin/mysql -u root -p"

# Prompt
autoload -U colors && colors
ZSH_THEME="m3-round"
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
DISABLE_AUTO_UPDATE="true"

zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

#** MY ADDS **#
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# # vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktegp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
HISTFILE="$HOME/.config/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
set -o vi
set -o AUTO_CD

se(){
  cd $(find -type d | fzf)
}
his(){
  history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c
}
0x0(){
  curl -F"file=@$(find $HOME -type f | dmenu -l 10)" 0x0.st | xclip -sel c
}

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# zle-line-init() { zle -K vicmd; }
# zle -N zle-line-init

source /home/kvl/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /home/kvl/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kvl/.config/zsh/aliasrc
source /home/kvl/.config/zsh/zsh-autopair/autopair.zsh
fpath=(/home/kvl/zsh-completions/src $fpath)
autopair-init
# colorscript random
# eval "$(starship init zsh)"

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
