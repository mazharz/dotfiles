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

export DIR_SHORTCUTS="w:$HOME/mzd/wd;n:$HOME/mzd/multimedia/not watched;m:$HOME/mzd/music;c:$HOME/mzd/code;g:$HOME/mzd/code/gwat;b:$HOME/mzd/text/book;o:$HOME/mzd/os;f:$HOME/mzd/text/Dropbox/finances;t:$HOME/mzd/text;d:$HOME/mzd/text/doc"

# nnn
export NNN_BMS="$DIR_SHORTCUTS"
export NNN_PLUG='e:-!sudo -E nvim "$nnn"*;f:fzcd;p:rsynccp;v:-!&umpv "$nnn"'
BLK="64" CHR="D6" DIR="42" EXE="47" REG="E6" HARDLINK="84" SYMLINK="8E" MISSING="66" ORPHAN="AF" FIFO="A6" SOCK="8A" OTHER="A0"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_OPENER=nnnopen
# this indicates shell being opened in nnn
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

# cargo
source "$HOME/.cargo/env"

# ghcup
[ -f "/home/m47h4r/.ghcup/env" ] && source "/home/m47h4r/.ghcup/env" # ghcup-env

