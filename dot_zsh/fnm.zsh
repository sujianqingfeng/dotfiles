# fnm
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/Users/hens/Library/Application Support/fnm:$PATH"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  export PATH="/home/hens/.local/share/fnm:$PATH"
  export PATH="/root/.local/share/fnm:$PATH"
else
fi

eval "`fnm env`"
