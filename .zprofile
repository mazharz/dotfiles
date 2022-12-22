# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
       . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

. "$HOME/.cargo/env"

# Scale qt apps
export QT_SCALE_FACTOR=1.3

# nnn
export NNN_BMS="w:$HOME/mzd/wd;n:$HOME/mzd/multimedia/not watched;m:$HOME/mzd/music;c:$HOME/mzd/code;b:$HOME/mzd/text/book"
export NNN_PLUG='e:-!sudo -E nvim $nnn*;f:fzcd;p:rsynccp;v:-!&umpv $nnn'
BLK="64" CHR="D6" DIR="42" EXE="47" REG="E6" HARDLINK="84" SYMLINK="8E" MISSING="66" ORPHAN="AF" FIFO="A6" SOCK="8A" OTHER="A0"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_OPENER=nnnopen
# this indicates shell being opened in nnn
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
