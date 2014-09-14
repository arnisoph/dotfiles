local return_code="%(?.. - %b%F{cyan}[%B%F{red}%?%b%F{cyan}]%f)"

function my_uh() {
  if [[ "$(id -u)" == 0 ]]; then
    echo '%B%F{red}%n%F{yellow}@%F{cyan}%m%f%b'
  else
    echo '%B%F{green}%n%F{yellow}@%F{cyan}%m%f%b'
  fi
}

function my_dir() {
  echo ' - %F{cyan}[%B%F{yellow}%~%b%F{cyan}]%f'
}


function my_load() {
  if [[ "$(id -u)" == 0 ]]; then
    echo " - %F{cyan}[%F{yellow}$(uptime | sed 's/.*load average: //' | awk -F', ' '{print $1}')/$(uptime | sed 's/.*load average: //' | awk -F', ' '{print $2}')/$(uptime | sed 's/.*load average: //' | awk -F', ' '{print $3}')%F{cyan}]%f"
  fi
}

function my_git() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)%F{yellow}${ref#refs/heads/}%f"
}

function my_time() {
  echo ' %F{green}%D{%H:%M:%S}'
}



PROMPT=$'
%F{cyan}┌──[ $(my_uh)$(my_dir)$(my_load)${return_code}
%F{cyan}└──[%f '

RPROMPT='$(my_git)$(my_time)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
