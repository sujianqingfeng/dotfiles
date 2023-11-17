# git
alias g='git'

alias gcl='git clont'

alias gb='git branch'

alias gl='git log'

alias gs='git status'

alias gst='git stash'

alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'


# forent

alias d='nr dev'
alias ds='nr serve'
alias db='nr build'
alias ns='nr start'

alias t='nr test'
alias tu="nr test -u"
alias tw="nr test --watch"

alias p='nr preview'
alias w="nr watch"

alias lint="nr lint"
alias lintf="nr lint --fix"

alias uli='nu --latest -i'


# dir
funciton i(){
  if [ -d "$HOME/work-space" ]; then
    cd ~/work-space/$1
  elif [ -d "$HOME/code-space" ]; then
    cd ~/code-space/$1
  fi
}


# conda alias
alias c='code .'

# common alias

alias rm='rm -rf'
alias cp='cp -r'
alias mv='mv -i'

