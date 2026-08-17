# Git
alias g='git'
alias gcl='git clone'
alias gb='git branch'
alias gl='git log'
alias gs='git status'
alias gst='git stash'
alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'

# Frontend
alias d='nr dev'
alias ds='nr serve'
alias db='nr build'
alias ns='nr start'
alias t='nr test'
alias tu='nr test -u'
alias tw='nr test --watch'
alias p='nr preview'
alias w='nr watch'
alias lint='nr lint'
alias lintf='nr lint --fix'
alias uli='nu --latest -i'

# Projects
i() {
  local workspace
  for workspace in "$HOME/work-space" "$HOME/code-space"; do
    if [ -d "$workspace" ]; then
      cd "$workspace${1:+/$1}" || return
      return
    fi
  done

  print -u2 "No workspace directory found"
  return 1
}

alias c='code .'
alias mv='mv -i'

# Claude Code via Zhipu GLM. Keep the token in macOS Keychain instead of Git.
cc-glm-set-token() {
  security add-generic-password \
    -U \
    -a "$USER" \
    -s "cc-glm-anthropic-token" \
    -w
}

cc-glm() {
  local auth_token

  if ! auth_token="$(security find-generic-password \
    -a "$USER" \
    -s "cc-glm-anthropic-token" \
    -w 2>/dev/null)"; then
    print -u2 "cc-glm: token not found; run cc-glm-set-token first"
    return 1
  fi

  env \
    ANTHROPIC_BASE_URL="https://open.bigmodel.cn/api/anthropic" \
    ANTHROPIC_AUTH_TOKEN="$auth_token" \
    CLAUDE_CODE_AUTO_COMPACT_WINDOW="1000000" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="glm-4.7" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="glm-5.3[1m]" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="glm-5.3[1m]" \
    claude --dangerously-skip-permissions "$@"
}
