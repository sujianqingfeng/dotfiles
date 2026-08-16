#!/bin/sh

set -eu

zshrc="$HOME/.zshrc"
local_zsh="$HOME/.zsh/local.zsh"

if [ ! -f "$zshrc" ] || [ -e "$local_zsh" ]; then
  exit 0
fi

sensitive_exports="$(grep -Ei '^export [A-Za-z_][A-Za-z0-9_]*(key|token|secret|password)=' "$zshrc" || true)"
if [ -z "$sensitive_exports" ]; then
  exit 0
fi

umask 077
mkdir -p "$HOME/.zsh"
printf '%s\n' "$sensitive_exports" > "$local_zsh"
