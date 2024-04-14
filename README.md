<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>


![Dotfiles](https://raw.githubusercontent.com/sanchezcarlosjr/sanchezcarlosjr/main/Screenshot_20240413_170426.png "Dotfiles")



## Restore your Dotfiles with script

Using wget
```bash
bash <(wget -qO- https://raw.githubusercontent.com/sanchezcarlosjr/dotly/HEAD/restorer)
```

Using curl
```bash
bash <(curl -s https://raw.githubusercontent.com/sanchezcarlosjr/dotly/HEAD/restorer)
```

You need to know your GitHub username, repository and install ssh key if your repository is private.

It also supports other git repos, but you need to know your git repository url.

## Restore your Dotfiles with Docker

<details>
<summary>Using Debian:</summary>

```bash
docker run -e TERM -e COLORTERM -w /root -it --rm debian sh -uec '
  apt-get update
  export USER="sanchezcarlosjr"
  apt-get install -y curl build-essential sudo python3 git g++
  su -c bash -c "$(curl -fsSL https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/restorer)"
  su -c zsh'
```
</details>




# TODO
https://github.com/fsquillace/junest
https://nvchad.com
docker
