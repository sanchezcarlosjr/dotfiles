<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>

## Restore your Dotfiles manually

* Install git
* Clone your dotfiles repository `git clone [your repository of dotfiles] $HOME/.dotfiles`
* Go to your dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive modules/dotly`
* Install your dotfiles `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly" "$DOTLY_PATH/bin/dot" self install`
* Restart your terminal
* Import your packages `dot package import`


## Restore your Dotfiles on Ubuntu
### Docker
```bash
apt-get update && apt-get install -y curl git build-essential sudo && su -c bash -c "$(curl -fsSL https://raw.githubusercontent.com/sanchezcarlosjr/dotfiles/HEAD/restorer)"

```
### Vagrant and host Ubuntu
```bash
sudo apt-get update && sudo apt-get install -y curl git build-essential && bash -c "$(curl -fsSL https://raw.githubusercontent.com/sanchezcarlosjr/dotfiles/HEAD/restorer)"
```


## Restore your Dotfiles on Arch Linux
### Docker
```bash
pacman -S --noconfirm sudo; sudo pacman -Syu --noconfirm && sudo pacman -S --noconfirm git curl base-devel && su -c bash -c "$(curel -fsSL https://raw.githubusercontent.com/sanchezcarlosjr/dotfiles/HEAD/restorer)"
```


## Restore your Dotfiles when you cannot either be Root or use sudo
https://github.com/fsquillace/junest

## Restore your Dotfiles with script

Using wget
```bash
bash <(wget -qO- https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/restorer)
```

Using curl
```bash
bash <(curl -s https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/restorer)
```

You need to know your GitHub username, repository and install ssh key if your repository is private.

It also supports other git repos, but you need to know your git repository url.

# Warning
If you use a path different from HOME you gotta change it manually.

# TODO
https://nvchad.com
