#Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ls="eza --icons --hyperlink -snew"
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Paths
export WK="$HOME/Workspace/"
export SS="/etc/systemd/system"
export SU="$HOME/.config/systemd/user"

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gic="git clone"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl="$DOTLY_PATH/bin/dot git pretty-log"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'

# Dotly
alias dy="$DOTLY_PATH/bin/dot"

# Micromamba
alias mb="micromamba"
alias mbi="micromamba install"
alias mbc="micromamba env create -f env.yml -y"
alias mba="micromamba activate"

# Editor
alias ed="nvim ."
alias e="nvim"
alias vi="nvim"

# Laravel
alias sail="./vendor/bin/sail"

# VPN
alias vpd="sudo openfortivpn -c ~/Workspace/playground/orgullosamente-pelicano/vpn/cicese_desarrollo.config"
alias vpi="sudo openfortivpn -c ~/Workspace/playground/orgullosamente-pelicano/vpn/cicese_vpn.config"
