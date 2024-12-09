# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

zstyle ':omz:update' mode disabled  # disable automatic updates

# Standard plugins can be found in $ZSH/plugins/
plugins=(
  colored-man-pages
  colorize
)

source $ZSH/oh-my-zsh.sh

# load my custom stuff
source $HOME/.config/zsh/vars.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/functions.zsh # make sure to place after vars, (b() uses one)
source $HOME/.config/zsh/git.zsh
