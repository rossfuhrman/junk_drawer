#http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it


export EDITOR=vim
export PGHOST=/tmp
export PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

#git aliases
alias ggd='git diff'
alias ggb='git branch'
alias ggbc='clear; git branch'

alias ggs='git status'
alias ggsc='clear; git status'

alias ggpom='git push origin master'

alias ggphm='git push heroku master'

alias ggd='git diff '

alias ggc='git checkout '
alias ggcb='git checkout -b '

#open git remote url in browser
alias ggo="git config --get remote.origin.url | sed 's/\.git//' | xargs open"

#heroku aliases
alias hho='heroku open'
alias hhp='heroku ps'
alias hhr='heroku restart'
alias hhc='heroku config'
alias hhl='heroku logs -n 1500'
alias hhb='heroku pgbackups'
alias hhdb='curl -o current.backup `heroku pgbackups:url`'

#tmux aliases
alias tt='tmuxinator'
alias ttl='tmuxinator ls'
alias ttk='tmux kill-session -t '



#other aliases
alias dif='diff'
alias cls='clear'

alias flush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

#find processes preventing machine from sleeping.  Look for the prevent sleep entries
alias nosleep='pmset -g assertions'



#search current directory for supplied string, exclude log files
grepx() { grep -r "$1" . --exclude *.log ; }
#search *code* directory for supplied string, exclude log files
grepcode() { grep -r "$1" ~/code/ --exclude *.log ; }

#search current directory for supplied string, include .rb files
grepxrb() { grep -r "$1" . --include *.rb ; }
#search current directory for supplied string, include .erb files
grepxerb() { grep -r "$1" . --include *.erb ; }
#search current directory for supplied string, include .css files
grepxcss() { grep -r "$1" . --include *.css ; }
#search current directory for supplied string, include .js files
grepxjs() { grep -r "$1" . --include *.js ; }
#search *code* directory for supplied string, include .rb files
grepcoderb() { grep -r "$1" ~/code/ --include *.rb ; }


alias findfile='find . -type f -print | grep' 
alias findfilecode='find ~/code/ type f -print | grep' 

PS1="[\w]$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

