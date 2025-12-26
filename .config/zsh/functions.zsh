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

n () {
  local script_to_run=$(jq < package.json '.scripts | keys[]' -r | fzf)
  if [[ -n "$script_to_run" ]]; then
    print -z npm run "$script_to_run"
  fi
}

# fzf
# find mang pages
function fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# Automatically activate python venv environment if it exists in relative path
function activate_python_env() {
  [ -f 'bin/activate' ] && source bin/activate
  [ -f '.venv/bin/activate' ] && source .venv/bin/activate
  [ -f 'venv/bin/activate' ] && source venv/bin/activate
  # [ -f 'environment.yml' ] && conda activate $(cat environment.yml | grep name: | head -n 1 | cut -f 2 -d ':')
  # [ -f 'environment.yaml' ] && conda activate $(cat environment.yaml | grep name: | head -n 1 | cut -f 2 -d ':')
  return 0
}
activate_python_env

function ww() {
  cd ~/mzd/code/fakir || exit
  tmux new -s notes -n notes -c "notes" \; \
    send-keys -t 1 "nvim -p todo.md daily-updates-2025.md" Enter\;
}

function b64e {
  echo -n "$1" | base64 -w 0
}

function b64d {
  echo -n "$1" | base64 -d
}

function re {
  sleep "$1"
  notify-send "${@:2}"
}
