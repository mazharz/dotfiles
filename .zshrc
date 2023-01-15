# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# disable automatic updates
zstyle ':omz:update' mode disabled  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  colored-man-pages
  colorize
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR='nvim'
VIM='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim="nvim"
alias v="nvim"
# frequest vim repositories
alias m="cd ~/mzd/text/markdowns; nvim"
alias t="nvim ~/mzd/text/markdowns/notes/todo.md"
# frequent directories
alias wd="cd ~/mzd/wd/; ls"
alias code="cd ~/mzd/code/; ls"
alias gwat="cd ~/mzd/code/gwat"
alias fin="cd ~/mzd/text/finances"
alias doc="cd ~/mzd/text/docs"
# others
alias backup="rsync -au --delete --progress /home/m47h4r/mzd/* /run/media/m47h4r/mzed"
alias sortMirrors="sudo reflector --latest 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias upgrade="google-chrome-stable https://archlinux.org && sudo pacman -Syu"
alias n="nnn -ex"
alias sss="sudo ss-local -c ~/.config/ss.json"
alias lg="lazygit"
alias tx="tmux"
alias ta="tmux attach-session"

# fast cd
c () {
  directories=(${(@s:;:)DIR_SHORTCUTS})
  for dir in ${directories}; do
    parts=(${(@s/:/)dir})
    if [[ "${parts[1]}" == "$1" ]]; then
      cd ${parts[2]}
    fi
  done
}

# export proxy
ep() {
  export http_proxy=http://127.0.0.1:3477
  export socks_proxy=socks5://127.0.0.1:3477
  export all_proxy=socks5://127.0.0.1:3477
}
# unset proxy
up() {
  unset http_proxy
  unset socks_proxy
  unset all_proxy
}
# print proxy
pp() {
  print $http_proxy
  print $socks_proxy
  print $all_proxy
}

export VOLTA_HOME="$HOME/.volta"

# used `pacman -Ql fzf` to figure out where this was
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse-list --info=hidden'
export FZF_DEFAULT_COMMAND='rg --hidden --files -g !node_modules -g !.git -g !.Trash\* .'

export PATH=$PATH:/home/m47h4r/bin/
export PATH=$PATH:/home/m47h4r/.local/bin # youtube-dl
export PATH="$VOLTA_HOME/bin:$PATH" # volta

# nnn
# this indicates shell being opened in nnn
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

export LEDGER_FILE=$HOME/mzd/text/finances/2023.journal
