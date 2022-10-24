zimfw() { source $DOTFILES_PATH/zsh/.zim/zimfw.zsh "${@}" }
zmodule() { source $DOTFILES_PATH/shell/zsh/.zim/zimfw.zsh "${@}" }

typeset -g _zim_fpath=($DOTFILES_PATH/shell/zsh/.zim/modules/git-info/functions)
fpath=(${_zim_fpath} ${fpath})
autoload -Uz -- coalesce git-action git-info
source $DOTFILES_PATH/shell/zsh/.zim/modules/environment/init.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/input/init.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/completion/init.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES_PATH/shell/zsh/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
