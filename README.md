
About

My dotfiles for a Ubuntu system, with zsh shell and monokai or solarized theme

# Installation

## Install zsh

    sudo apt-get install zsh

    chsh -s /bin/zsh

## Install submodules

    git submodule init

    git submodule update

## Install 

Run:

    ./install.sh

# Update

To update submodules

    git submodule foreach git pull origin master

# TODO

- Remove all solarized
- https://github.com/Lokaltog/powerline
