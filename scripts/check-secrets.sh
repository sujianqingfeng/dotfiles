#!/bin/sh

set -eu

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"

file_list=$(mktemp)
trap 'rm -f "$file_list"' EXIT HUP INT TERM

git ls-files --cached --others --exclude-standard >"$file_list"

pattern="(sk|nvapi|tp)-[A-Za-z0-9_-]{16,}|(api[_-]?key|auth[_-]?token|access[_-]?token|secret|password)[A-Za-z0-9_ -]*[=:][[:space:]]*[\"']?[A-Za-z0-9_./+-]{16,}"
found=0

while IFS= read -r file; do
  case "$file" in
    dot_oh-my-zsh/* | scripts/check-secrets.sh) continue ;;
  esac

  [ -f "$file" ] || continue
  lines=$(grep -nEI "$pattern" "$file" 2>/dev/null | cut -d: -f1 | paste -sd, - || true)
  if [ -n "$lines" ]; then
    printf '%s: suspicious credential at line(s) %s\n' "$file" "$lines"
    found=1
  fi
done <"$file_list"

if [ "$found" -ne 0 ]; then
  printf '%s\n' 'Secret scan failed. Move credentials to Keychain, 1Password, or a local ignored file.' >&2
  exit 1
fi

printf '%s\n' 'Secret scan passed.'
