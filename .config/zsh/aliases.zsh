# command shortenings
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias la="ls -a --color=auto"
alias pk="pkill"
alias grep="grep --color=auto"

alias vim="nvim"
alias v="nvim"

alias q="qalc"

# frequent vim repositories
alias m="cd ~/mzd/text/Dropbox/markdowns; nvim"

# tmux
alias tx="tmux"
alias ta="tmux attach-session"
alias txs="tmux-sessionizer"

# packages
alias packageRemoveOrphans='sudo pacman -Rs $(pacman -Qdtq)'
alias packageSortMirrors="sudo reflector --age 6 --fastest 10 --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

# calendars
alias cy="cal -y"
alias c3="cal -3"
alias c="cal"
alias jcy="jcal -y"
alias jc3="jcal -3"
alias jc="jcal"

# others
alias backup="rsync -a --delete --delete-excluded --progress /home/mazhar/mzd/* /run/media/mazhar/mzed"
alias backup2="rsync -a --delete --delete-excluded --progress /home/mazhar/mzd/* /run/media/mazhar/mzd"
alias lg="lazygit"
alias ldg="ledger"
alias f="cd $HOME/mzd/text/Dropbox/finances; nvim ${LEDGER_FILE}"
alias sx="startx"
alias wgc="wget --continue"
alias nb="newsboat"
