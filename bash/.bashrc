# GENERAL
_os=$(uname)

# VARIABLES

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  export PS1='\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'
else
  export PS1='\u@\h \w \$'
fi

unset color_prompt force_color_prompt

# MISC

[[ -e $HOME/.shell_common ]] && source $HOME/.shell_common
[[ -e $HOME/.bash_local ]] && source $HOME/.bash_local
[[ -e $HOME/.bash_aliases ]] && source $HOME/.bash_aliases

true
