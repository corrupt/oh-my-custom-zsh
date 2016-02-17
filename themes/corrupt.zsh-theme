# This is a fork of crcandy by Filipe Chagas (https://github.com/filipechagas) with a modified user@host prompt

prompt_userhost() {
	if [[ $UID -eq 0 ]] 
	then
		PR="%{$fg_bold[red]%}%n"
	else
		PR="%{$fg_bold[green]%}%n"
	fi
	echo "${PR}%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg[blue]%}%D{[%I:%M:%S]}"
}

PROMPT=$'
$(prompt_userhost) %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
