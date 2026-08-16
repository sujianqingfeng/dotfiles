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
