#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

function create_link {
    if [ -e "$HOME/$2" ]; then
        echo "$(tput setaf 3)WARNING:$(tput sgr 0) $2 already exists, ignored"
    else
        ln -s "$HOME/dotfiles/$1" "$HOME/$2"
        check_success $? "Create symlink $2"
    fi
} 

function check_success {
    if [ $1 -eq 0 ]; then
        echo "$2: $(tput setaf 2)OK$(tput sgr 0)"
    else
        echo "$2: $(tput setaf 1)FAILURE$(tput sgr 0)"
        exit 1
    fi
}

# Enter script dir

cd $DIR

# GIT Submodules

git submodule update --init
check_success $? "Install GIT submodules"

# brew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
check_success $? "Install brew"

# brew cask

brew install caskroom/cask/brew-cask

# zsh

brew install zsh
check_success $? "Install zsh"

# oh-my-zh

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
check_success $? "Install oh-my-zsh"
create_link ".zshrc" ".zshrc"

# Git

create_link ".gitconfig" ".gitconfig"
create_link ".git-template" ".git-template"

# Vim

mkdir -p "$HOME/.vimtmp"
create_link ".vim" ".vim"
create_link ".vimrc" ".vimrc"

# SSH

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Sublime Text 3

if [ ! -e "$HOME/Library/Application Support/Sublime Text 3" ]; then
    
    # Settings
    mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages"
    ln -s "$HOME/dotfiles/st3/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"   
    echo "$(tput setaf 3)Sublime Text 3 settings symlinked. Download and install Sublime Text 3.$(tput sgr 0)"
    
    # Package Control
    # https://sublime.wbond.net/installation
    mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
    curl -o "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
    echo "$(tput setaf 3)Sublime Text 3 Package Control is downloaded and will be installed on first run. Will need some time restarts to function correct. $(tput sgr 0)"

else
    echo  $(tput setaf 3)WARNING:$(tput sgr 0) Sublime Text 3 already exists, ignored
fi

# subl everywhere
# create_link "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"

