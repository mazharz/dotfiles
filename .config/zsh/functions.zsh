# export proxy
ep() {
  if [[ "$1" != "" ]];then
    port="$1"
  else
    port="8086"
  fi
  export http_proxy="http://127.0.0.1:$port"
  export socks_proxy="socks5://127.0.0.1:$port"
  export all_proxy="socks5://127.0.0.1:$port"
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

# fzf
# find mang pages
function fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

