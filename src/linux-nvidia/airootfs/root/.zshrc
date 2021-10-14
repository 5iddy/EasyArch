# Lines configured by zsh-newuser-install
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=~/.history/zsh
HISTSIZE=100000
SAVEHIST=100000

autoload -Uz vcs_info
zstyle ':vsc_info:*' enable git
zstyle ':vcs_info:*' formats '%F{green}(%r)%f%F{cyan}[%b]%f '

precmd(){ vcs_info ; print -rP "%B$vcs_info_msg_0_%F{red}->%f%b %F{cyan}%/%f" }
PS1="%B%F{red}[%f%b %F{cyan}%n%f%B%F{red}@%f%b%F{green}%m%f %B%F{red}] $ %f%b"


setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


bindkey "\eOA" up-line-or-history
bindkey "\eOB" down-line-or-history
bindkey "\eOC" forward-char
bindkey "\eOD" delete-char
bindkey '\e[3~' delete-char
bindkey '^[[F' end-of-line
bindkey '^[[H' beginning-of-line
stty eof '^-'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
