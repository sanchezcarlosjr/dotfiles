#Enable aliases to be sudo’ed
alias sudo='sudo '

# Navigation
alias cd="z"
alias ..="cd .."
alias ...="cd ../.."
alias ls="eza --icons --hyperlink -snew -F --color-scale"
alias ll="ls -l"
alias la="ls -la"
alias lt="la -T"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'
alias less="moar"
alias b="bat"
alias df="duf"
#alias ps="procs --tree"


# Scaffolds
alias mkenv="dot scaffolds script --language mkenv.kdl --output .mkenv.kdl && chmod -x .mkenv.kdl"

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gic="git clone"
alias gca="git add --all && git commit --amend --no-edit"
alias gcm="git add -A && git commit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl="$DOTLY_PATH/bin/dot git pretty-log"
alias grc="git rm --cached"
alias lc="lazygit"

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
alias mce="micromamba env create -f env.yml -y"
alias mbc="micromamba env create -n $1"
alias mba="micromamba activate"

# Editor
alias ed="nvim ."
alias v.="nvim ."
alias e="nvim"
alias vi="nvim"


# ZSH
alias reload="source ~/.zshrc"

# Laravel
alias sail="./vendor/bin/sail"

# SSH
alias ssh="kitty +kitten ssh"
alias s="kitty +kitten ssh"
