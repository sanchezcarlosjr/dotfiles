# save current zshrc
mv ~/.zshrc ~/.zshrc.bak

sudo sh -c "$(wget curl -fsSL https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh)" -- \
    -t agnoster

# remove newly created zshrc
rm -f ~/.zshrc
# restore saved zshrc
mv ~/.zshrc.bak ~/.zshrc
# update theme
sed -i '/^ZSH_THEME/c\ZSH_THEME="agnoster"' ~/.zshrc