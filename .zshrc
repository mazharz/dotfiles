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
  docker
  docker-compose
  colored-man-pages
  colorize
  command-not-found
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
alias vi="nvim"
alias v="nvim"
alias wd="cd ~/mzd/wd/; ls"
alias code="cd ~/mzd/code/; ls"
alias m="cd ~/mzd/text/markdowns; nvim"
alias t="nvim ~/mzd/text/markdowns/notes/todo.md"
alias backup="rsync -au --delete --progress /home/m47h4r/mzd/* /run/media/m47h4r/mzed"
alias gwat="cd ~/mzd/code/gwat"
alias sortMirrors="sudo reflector --latest 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias upgrade="google-chrome-stable https://archlinux.org && sudo pacman -Syu"

# add nvm path
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# used `pacman -Ql fzf` to figure out where this was
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse-list --border'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/m47h4r/bin/
export PATH=$PATH:/home/m47h4r/.local/bin # youtube-dl
