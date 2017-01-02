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
bindkey '' clear-screen

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
alias dd="dd status=progress"
#alias pass-sva="PASSWORD_STORE_DIR=~/.password-store-sva pass"

# global
alias -g grep='grep --color=auto'
alias -g G='|grep -i'
alias -g L='|less'

# }}}

function soffice () {
	GTK2_RC_FILES=$HOME/.gtkrc-2.0-libreoffice /usr/bin/soffice $@
}
function libreoffice () {
	GTK2_RC_FILES=$HOME/.gtkrc-2.0-libreoffice /usr/bin/libreoffice $@
}


#-------------->8------------------->8------------------->8-----------------

function mkcd() {
	mkdir $1 && cd $1
}

#-------------->8------------------->8------------------->8-----------------

#proper ssh hosts autocompletion
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
_ssh_config+=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:hosts' hosts $_ssh_config

#-------------->8------------------->8------------------->8-----------------

#pass completion for svapass alias
compdef _pass svapass 
compdef -e "PASSWORD_STORE_DIR=$HOME/.password-store-sva _pass" svapass 
#zstyle ':completion::complete:svapass::' prefix "$HOME/.password-store-sva"
#zstyle ':completion:*:svapass:*:*' environ PASSWORD_STORE_DIR="$HOME/.password-store-sva"
svapass () {
  PASSWORD_STORE_DIR=$HOME/.password-store-sva pass $@
}


#pass completion anywhere in _values
#zstyle ':completion::complete:pass::' matcher-list 'm:{a-z-}={A-Z_} l:|=* r:|=*'
#zstyle ':completion::complete:svapass::' matcher-list 'm:{a-z-}={A-Z_} l:|=* r:|=*'
zstyle ':completion::complete:pass::' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:svapass::' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:pass::' menu select
zstyle ':completion::complete:svapass::' menu select
#zstyle ':completion::complete:pass::' matcher-list 'm:{a-z-}={A-Z_} l:|=* r:|=*'
