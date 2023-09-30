# command shortenings
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias pk="pkill"
alias grep="grep --color=auto"

alias vim="nvim"
alias v="nvim"

# frequent vim repositories
alias m="cd ~/mzd/text/markdowns; nvim"
alias t="nvim ~/mzd/text/markdowns/notes/todo.md"

# tmux
alias tx="tmux"
alias ta="tmux attach-session"
alias txs="tmux-sessionizer"

# others
alias backup="rsync -au --delete --progress /home/m47h4r/mzd/* /run/media/m47h4r/mzed"
alias sortMirrors="sudo reflector --latest 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias upgrade="google-chrome-stable https://archlinux.org && sudo pacman -Syu"
alias n="nnn -ex"
alias sss="sudo ss-local -c ~/.config/ss.json"
alias lg="lazygit"
alias hl="hledger"
alias sx="startx"
