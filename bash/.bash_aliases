
# git
alias gs='git status'
alias gb='git branch'
alias gl='git log --oneline'
alias gcm='git checkout master'
alias gb='git branch'
alias gcb='git rev-parse --abbrev-ref HEAD'
alias gca='git commit --amend'
alias gp='git pull'
alias gsl='git stash list'
alias gd='git diff'
alias gdc='git diff --cached'
ga() {
  git add $@
}
gc() {
  git commit -m "$@"
}
grh() {
  git reset HEAD "$@"
}
gss() {
  git stash save $@
}
gsp() {
  git stash pop $@
}
gsd() {
  git stash drop $@
}

alias off='systemctl poweroff'
alias logout='i3-msg exit'
alias lock='i3lock -t -i ~/Pictures/screenlock.png'
alias suspend='i3lock -t -i ~/Pictures/screenlock.png && systemctl suspend'
alias restart='systemctl reboot'
alias reboot='systemctl reboot'

# docker
alias dil='docker image list'
alias dila="docker image list -a"
alias dsp='docker system prune -f'
alias dcl='docker container list -a'
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
dip() {
    docker container inspect $@ --format "{{ .NetworkSettings.Networks.bridge.IPAddress }}"
}

# ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# less - ignore case upon search, unless uppercase letter in search pattern
alias less='less -i'

## merge a PR into master, locally, & run it
cpr(){
  git checkout "$1"
  git pull origin "$1"
  cmaster
  git merge origin "$1"
  cd $PWD/frontend && nvm use && yarn
  cd ..
  docker-compose up --build
}
## cleanup, reset HEAD, pull upstream
crh(){
  sudo rm -rf $PWD/frontend/node_modules
  git checkout -- $PWD/frontend/yarn.lock
  git reset --hard HEAD~200
  git pull origin master
}
## cleanup & move to another branch, build & up
cbranch(){
  cmaster
  git checkout "$1"
  git pull origin "$1"
  cd $PWD/frontend && nvm use && yarn
  cd ..
  docker-compose up --build
}
## cleanup, move to master, pull upstream
cmaster(){
  docker-compose down
  sudo rm -rf $PWD/frontend/node_modules
  git checkout -- $PWD/frontend/yarn.lock
  git checkout master
  git pull
}

nrm(){
  sudo rm -rf "./$@/node_modules"
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


# i3
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias off='systemctl poweroff'
alias logout='i3-msg exit'
alias lock='i3lock -t -i ~/Pictures/screenlock.png'
alias suspend='i3lock -t -i ~/Pictures/screenlock.png && systemctl suspend'

alias monitor_left='xrandr --output HDMI1 --auto && xrandr --output HDMI1 --left-of LVDS1'
alias monitor_right='xrandr --output HDMI1 --right-of LVDS1'

alias monitor_auto='xrandr --output HDMI1 --auto'
alias monitor_off='xrandr --output HDMI1 --off'

alias laptop_auto='xrandr --output LVDS1 --auto'
alias laptop_off='xrandr --output LVDS1 --off'
