<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>


![Screenshot_20240710_084118](https://github.com/sanchezcarlosjr/dotfiles/assets/24639141/270da422-17b6-4ab4-8e80-bf1da6190c2f)



## Restore your Dotfiles with a script

Using wget
```bash
bash <(wget -qO- https://raw.githubusercontent.com/sanchezcarlosjr/dotly/HEAD/restorer)
```

Using curl
```bash
bash <(curl -s https://raw.githubusercontent.com/sanchezcarlosjr/dotly/HEAD/restorer)
```

You need to know your GitHub username and repository, and install the SSH key if your repository is private.

It also supports other git repos, but you must know your git repository URL.

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
