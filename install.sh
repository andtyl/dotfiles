#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

function create_link {
    #test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
    
    if [ -e "$HOME/$2" ]; then
        echo "$(tput setaf 3)WARNING:$(tput sgr 0) $2 already exists, ignored"
    else
        ln -s "$HOME/$1" "$HOME/$2"
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

echo "Installing GIT submodules..."
git submodule update --init
check_success $? "Install GIT submodules"

# zsh

echo "Installing zsh, needs your password..."
sudo apt-get install zsh
check_success $? "Install zsh"

echo "Setting zsh as default shell, needs your password..."
chsh -s $(which zsh)
check_success $? "Set zsh as default shell"

# Copy and customize template if not .zshrc already exists

if [ ! -e "~/.zshrc" ]; then
    # Copy template    
    cp ~/dotfiles/shell/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    
    # Customize
    sed -i.bak -r 's/ZSH=".*?"/ZSH="$HOME/dotfiles/shell/oh-my-zsh"/'
    sed -i.bak -r 's/ZSH_THEME=".*?"/ZSH_THEME="risto"/' ~/.zshrc # Change theme 
    echo -e "\n# Custom" >> ~/.zshrc
    echo -e "\n# Path\nexport PATH=~/dotfiles/bin:\$PATH" >> ~/.zshrc
    echo -e "\n# Dircolors\neval \`dircolors ~/dotfiles/shell/dircolors-solarized/dircolors.256dark\`" >> ~/.zshrc
    echo -e "\n# 256 color terminal\nexport TERM=xterm-256color" >> ~/.zshrc

    check_success 0 "Create .zshrc"
else
    echo  $(tput setaf 3)WARNING:$(tput sgr 0) .zshrc already exists, will not modify
fi

# gnome-terminal-colors-solarized

echo "Installing gnome-terminal-colors-solarized profile"
./shell/gnome-terminal-colors-solarized/install.sh

# Create symlinks

echo "Creating symlinks..."
create_link ".gitconfig" ".gitconfig"
create_link ".vimrc" ".vimrc"
create_link ".vim" ".vim"

# SSH

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

