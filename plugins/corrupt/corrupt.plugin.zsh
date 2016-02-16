setopt automenu 
unsetopt beep equals

# key bindings {{{

#nice completion features including the fancy menu-mode
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Z}'

bindkey '^[[5~' history-beginning-search-backward #pg-up
bindkey '^[[6~' history-beginning-search-forward #pg-dn
bindkey '^A' beginning-of-line #ctrl-a
bindkey '^H' beginning-of-line #ctrl-h
bindkey '^[OH' beginning-of-line #pos-1
bindkey '^[[7~' beginning-of-line #pos-1-laptop
bindkey '^[[H' beginning-of-line #pos-1 on mac keyboard?
bindkey '^E' end-of-line #ctrl-e
bindkey '^L' end-of-line #ctrl-l
bindkey '^[OF' end-of-line #end
bindkey '^[[8~' end-of-line #end-laptop
bindkey '^[[F' end-of-line #end on mac keyboard?
bindkey '^[[3~' delete-char #del
bindkey '^J' backward-word #crtl-j
bindkey '^K' forward-word #crtl-k

# }}}

# aliases {{{
#
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lsd='ls --color=auto -d */'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cls='clear'
alias hugs='hugs -Evim'
alias tmux="tmux -2"

# global
alias -g grep='grep --color=auto'
alias -g G='|grep -i'
alias -g L='|less'

# }}}


function mkcd() {
	mkdir $1 && cd $1
}
