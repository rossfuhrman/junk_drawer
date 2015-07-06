#function that will run the passed in command and use the OSX say command to announce the exit status of the command
say_status_of_command() {
  eval $1

  if [ $? -eq 0 ]
  then
    say ""
  else
    say "Oops! Something went wrong"
    say $1 #say the command that was passed in
  fi
}

#these have to be functions because you cannot pass parameters to an alias
git_branch() {
  say_status_of_command "git branch"
}
git_branch_clear() {
  say_status_of_command "clear; git branch"
}
git_status() {
  say_status_of_command "git status"
}
git_status_clear() {
  say_status_of_command "clear; git status"
}
git_push_origin_master() {
  say_status_of_command "git push origin master"
}
git_push_heroku_master() {
  say_status_of_command "git push heroku master"
}

heroku_open() {
  say_status_of_command "heroku open"
}
heroku_ps() {
  say_status_of_command "heroku ps"
}
heroku_restart() {
  say_status_of_command "heroku restart"
}
heroku_config() {
  say_status_of_command "heroku config"
}
heroku_logs() {
  say_status_of_command "heroku logs -n 1500"
}
heroku_pgbackups() {
  say_status_of_command "heroku pg:backups"
}


#http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it


export PS1="\w$ "
export EDITOR=vim
export PGHOST=/tmp
export PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

#git aliases
alias ggb=git_branch
alias ggbc=git_branch_clear

alias ggphm=git_push_heroku_master

alias ggd='git diff '

alias ggs=git_status
alias ggsc=git_status_clear

alias ggc='git checkout '
alias ggcb='git checkout -b '

alias ggpom='git_push_origin_master'

#this command came from https://gist.github.com/Bantik/6004772
#alias ggo='git config --get remote.origin.url | ruby -ne '\''puts %{https://github.com/#{$_.split(/.com[\:\/]/)[-1].gsub(".git","")}}'\'' | xargs open'
#No need for the ruby regex though
alias ggo="git config --get remote.origin.url | sed 's/\.git//' | xargs open"

#heroku aliases
alias hho=heroku_open
alias hhp=heroku_ps
alias hhr=heroku_restart
alias hhc=heroku_config
alias hhl=heroku_logs
alias hhb=heroku_pgbackups
#alias hhdb='curl -o current.backup `heroku pgbackups:url`' #old command
alias hhdb='curl -o current.backup `heroku pg:backups public-url`'

#tmux aliases
alias tt='tmuxinator'
alias ttl='tmuxinator ls'
alias ttk='tmux kill-session -t '


#other aliases

alias dif='diff'
alias cls='clear'

alias flush='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

#for those old projects that require version 1.0.20 of bundler
alias bb20='bundle _1.0.20_ exec '


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

# https://github.com/kien/ctrlp.vim/issues/359
stty -ixon -ixoff

#make the terminal behave vim-like bindings
set -o vi

