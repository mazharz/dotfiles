# bash configurational variables
HISTSIZE=10000
HISTFILESIZE=10000

# vim
VIM='nvim'
export EDITOR='nvim'
# tools
export VOLTA_HOME="$HOME/.volta"
# fzf
# used `pacman -Ql fzf` to figure out where this was
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse-list --info=hidden'
export FZF_DEFAULT_COMMAND='rg --hidden --files -g !node_modules -g !.git -g !.Trash\* .'
# ledger
export LEDGER_FILE=$HOME/mzd/text/Dropbox/finances/2024.journal
# PATH
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$PATH:/home/m47h4r/bin/

# Scale qt apps
export QT_SCALE_FACTOR=1.3

export DIR_SHORTCUTS="w:$HOME/mzd/wd;n:$HOME/mzd/multimedia/not watched;m:$HOME/mzd/music;c:$HOME/mzd/code;b:$HOME/mzd/text/book;o:$HOME/mzd/os;f:$HOME/mzd/text/Dropbox/finances;t:$HOME/mzd/text;d:$HOME/mzd/text/doc"

# ranger
[ -n "$RANGER_LEVEL" ] && PS1="R$RANGER_LEVEL $PS1"

# cargo
source "$HOME/.cargo/env"

# go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# haskell
[ -f "/home/m47h4r/.ghcup/env" ] && . "/home/m47h4r/.ghcup/env"
