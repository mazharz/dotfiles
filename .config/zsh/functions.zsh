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
  echo 'http_proxy='$http_proxy
  echo 'socks_proxy='$socks_proxy
  echo 'all_proxy='$all_proxy
}

# bookmark
b () {
  directories=(${(@s:;:)DIR_SHORTCUTS})
  for dir in ${directories}; do
    parts=(${(@s/:/)dir})
    if [[ "${parts[1]}" == "$1" ]]; then
      cd ${parts[2]}
    fi
  done
}

# lock private stuff
_DIRS_TO_LOCK="$HOME/mzd/text/markdowns/notes/private;$HOME/mzd/multimedia/private"
lock_private() {
  directories=(${(@s:;:)_DIRS_TO_LOCK})
  for dir in ${directories}; do
    sudo chmod 000 "$dir"
  done
}
unlock_private() {
  directories=(${(@s:;:)_DIRS_TO_LOCK})
  for dir in ${directories}; do
    sudo chmod 755 "$dir"
  done
}

# fzf
# find mang pages
function fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

