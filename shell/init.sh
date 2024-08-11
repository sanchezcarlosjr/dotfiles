# This is a useful file to have the same aliases/functions in bash and zsh

source "$DOTFILES_PATH/shell/aliases.sh"
source "$DOTFILES_PATH/shell/exports.sh"
source "$DOTFILES_PATH/shell/functions.sh"
source "/usr/share/nvm/init-nvm.sh"
source "$HOME/Vaults/primary/secrets.sh" 2>/dev/null
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

### Added by Codeium. These lines cannot be automatically removed if modified
if command -v termium > /dev/null 2>&1; then
  eval "$(termium shell-hook show post)"
fi
### End of Codeium integration


