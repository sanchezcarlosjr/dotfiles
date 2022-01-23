#!/bin/sh
# https://github.com/deluan/zsh-in-docker

set -e
EXPORTS_FILE="$DOTFILES_PATH/shell/exports.sh"
THEME=default
ZSHRC_APPEND=""

while getopts ":t:a:" opt; do
    case ${opt} in
        t)  THEME=$OPTARG
            ;;
        a)  ZSHRC_APPEND="$ZSHRC_APPEND\n$OPTARG"
            ;;
        \?)
            echo "Invalid option: $OPTARG" 1>&2
            ;;
        :)
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            ;;
    esac
done
shift $((OPTIND -1))
echo
echo "Installing Oh-My-Zsh with:"
echo "  THEME   = $THEME"
echo

check_dist() {
    (
        . /etc/os-release
        echo $ID
    )
}

append_or_replace() {
    line=$1
    file=$2
    if grep -Fxq "$line" $file
    then
        echo "append_or_replace: Line exits: $line"
    else
        sed -i "1s/^/$line\n/" $file
    fi
}

check_version() {
    (
        . /etc/os-release
        echo $VERSION_ID
    )
}

install_dependencies() {
    DIST=`check_dist`
    VERSION=`check_version`
    echo "###### Installing dependencies for $DIST"

    if [ "`id -u`" = "0" ]; then
        Sudo=''
    elif which sudo; then
        Sudo='sudo'
    else
        echo "WARNING: 'sudo' command not found. Skipping the installation of dependencies. "
        echo "If this fails, you need to do one of these options:"
        echo "   1) Install 'sudo' before calling this script"
        echo "OR"
        echo "   2) Install the required dependencies: git curl zsh"
        return
    fi
    case $DIST in
        centos | amzn)
            $Sudo yum update -y
            $Sudo yum install -y ncurses-compat-libs # this is required for AMZN Linux (ref: https://github.com/emqx/emqx/issues/2503)
        ;;
        arch)
            localectl set-locale LANG=en_US.UTF-8
        ;;
        *)
            $Sudo apt-get update
            $Sudo apt-get -y install git curl zsh locales
            if [ "$VERSION" != "14.04" ]; then
                $Sudo apt-get -y install locales-all
            fi
            $Sudo locale-gen en_US.UTF-8
    esac
}

zshrc_template() {
    _HOME=$1;
    _THEME=$2; shift; shift

    if [ "$_THEME" = "default" ]; then
        _THEME="powerlevel10k/powerlevel10k"
    fi
    append_or_replace "export LANG='en_US.UTF-8'" $EXPORTS_FILE
    append_or_replace "export LANGUAGE='en_US:en'" $EXPORTS_FILE
    append_or_replace "export LC_ALL='en_US.UTF-8'" $EXPORTS_FILE
    append_or_replace "export TERM=xterm" $EXPORTS_FILE

}

powerline10k_config() {
    append_or_replace "export POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_last'" $EXPORTS_FILE
    append_or_replace "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs status)" $EXPORTS_FILE
    append_or_replace "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()" $EXPORTS_FILE
    append_or_replace "POWERLEVEL9K_STATUS_OK=false" $EXPORTS_FILE
    append_or_replace "POWERLEVEL9K_STATUS_CROSS=true" $EXPORTS_FILE
}


# Handle themes
if [ "`echo $THEME | grep -E '^http.*'`" != "" ]; then
    theme_repo=`basename $THEME`
    THEME_DIR="$DOTFILES_PATH/shell/zsh/themes/$theme_repo"
    git clone $THEME $THEME_DIR
    theme_name=`cd $THEME_DIR; ls *.zsh-theme | head -1`
    theme_name="${theme_name%.zsh-theme}"
    THEME="$theme_repo/$theme_name"
fi

zshrc_template "$HOME" "$THEME"

# Install powerlevel10k if no other theme was specified
if [ "$THEME" = "default" ]; then
    git clone https://github.com/romkatv/powerlevel10k $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    powerline10k_config
fi