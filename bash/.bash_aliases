
# git
alias gs='git status'
alias gc='git commit -m'
alias gcm='git checkout master'
alias gb='git branch'
alias gl='git log --oneline'

alias off='systemctl poweroff'
alias logout='i3-msg exit'
alias lock='i3lock -t -i ~/Pictures/screenlock.png'
alias suspend='i3lock -t -i ~/Pictures/screenlock.png && systemctl suspend'

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

# ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# i3
alias monitor_left='xrandr --output HDMI1 --auto && xrandr --output HDMI1 --left-of LVDS1'
alias monitor_right='xrandr --output HDMI1 --right-of LVDS1'

alias monitor_auto='xrandr --output HDMI1 --auto'
alias monitor_off='xrandr --output HDMI1 --off'

alias laptop_auto='xrandr --output LVDS1 --auto'
alias laptop_off='xrandr --output LVDS1 --off'

# docker
alias dil='docker image list'
alias dsp='docker system prune -f'
alias dcl='docker container list -a'

joplin() {
  command ~/.joplin/Joplin.AppImage --no-sandbox &
}

