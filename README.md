
About

My dotfiles for a Ubuntu system, with zsh shell and solarized theme everywhere :)

# Installation

## Install zsh

    sudo apt-get install zsh

    chsh -s /bin/zsh

## Install submodules

    git submodule init

    git submodule update

## Install gnome-terminal-colors-solarized

    ./shell/gnome-terminal-colors-solarized/install.sh

## Make symlinks 

Run:

    ./makesyminks.sh

## Config oh-my-zsh

Copy the template

    cp ~/dotfiles/shell/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

Customize

    export ZSH=$HOME/dotfiles/shell/oh-my-zsh

    ZSH_THEME="risto"

Add this to bottom

```
# Path
export PATH=~/dotfiles/bin:$PATH
 
# Dircolors
eval `dircolors ~/dotfiles/shell/dircolors-solarized/dircolors.256dark`
 
# 256 color terminal
export TERM=xterm-256color
```

# Update

To update submodules

    git submodule foreach git pull origin master

# TODO

- https://github.com/Lokaltog/powerline
