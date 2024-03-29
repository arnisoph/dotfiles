# GENERAL
_os=$(uname)

if [[ -e /usr/local/share/oh-my-zsh ]]; then
  export ZSH=/usr/local/share/oh-my-zsh
elif [[ -e $HOME/Documents/dev/oh-my-zsh ]]; then
  export ZSH=$HOME/Documents/dev/oh-my-zsh
else
  export ZSH=$HOME/.oh-my-zsh
fi

# OH-M-ZSHELL SETTINGS
ZSH_THEME=arbe
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.ohmyzsh/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo colored-man-pages)

export DISABLE_MAGIC_FUNCTIONS=true
source ${ZSH}/oh-my-zsh.sh

# ZSH SETTINGS
set -k
HISTSIZE=1000000
SAVEHIST=${HISTSIZE?}
HISTFILE=~/.history
export HISTTIMEFORMAT="%Y-%m-%d% H:%M"
#export HISTCONTROL="erasedups:ignoreboth"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.

# AUTOCOMPLETION
zmodload -i zsh/complist
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _correct _approximate _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete
#zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' accept-exact false
_comp_options+=(globdots)

# ALIASES
alias zshrc='vim ~/.zshrc'

# NUMBLOCK/KEYPAD FIXES FROM http://superuser.com/questions/742171/zsh-z-shell-numpad-numlock-doesnt-work
if [[ -n "$(which bindkey 2>/dev/null)" ]]; then
  # 0 . Enter
  bindkey -s "^[OM" "^M"
fi

# MISC
preexec() {
    typeset -gi CALCTIME=1
    typeset -gi CMDSTARTTIME=SECONDS
}

precmd() {
    if (( CALCTIME )) ; then
        typeset -gi ETIME=SECONDS-CMDSTARTTIME
    fi
    typeset -gi CALCTIME=0
}

[[ -e $HOME/.shell_common ]] && source $HOME/.shell_common
[[ -e $HOME/.zsh_local ]] && source $HOME/.zsh_local
[[ -e $HOME/.zsh_aliases ]] && source $HOME/.zsh_aliases


# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/bin/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/bin/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/bin/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/bin/google-cloud-sdk/completion.zsh.inc"; fi

true
