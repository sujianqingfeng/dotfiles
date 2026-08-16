# fnm
if [ -d "$HOME/Library/Application Support/fnm" ]; then
  export PATH="$HOME/Library/Application Support/fnm:$PATH"
fi

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --shell zsh)"
fi
