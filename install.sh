#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

function create_link {
    #test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
    
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

echo "Installing GIT submodules..."
git submodule update --init
check_success $? "Install GIT submodules"

# zsh

echo "Installing zsh and curl, needs your password..."
sudo apt-get -y install zsh curl
check_success $? "Install zsh"

echo "Setting zsh as default shell, needs your password..."
chsh -s $(which zsh)
check_success $? "Set zsh as default shell"

# Copy and customize template if not .zshrc already exists

if [ ! -e "$HOME/.zshrc" ]; then
    # Copy template    
    cp ~/dotfiles/shell/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    
    # Customize
    sed -i.bak -r 's/export ZSH=".*?"/export ZSH="$HOME/dotfiles/shell/oh-my-zsh"/' ~/.zshrc # Change oh-my-zsh location 
    sed -i.bak -r 's/ZSH_THEME=".*?"/ZSH_THEME="risto"/' ~/.zshrc # Change theme 
    echo -e "\n# Custom" >> ~/.zshrc
    echo -e "\n# Path\nexport PATH=~/dotfiles/bin:\$PATH" >> ~/.zshrc
    echo -e "\n# 256 color terminal\nexport TERM=xterm-256color" >> ~/.zshrc
    #echo -e "\n# Base16\nBASE16_SCHEME=\"monokai\"\nBASE16_SHELL=\"$HOME/base16-shell/base16-$BASE16_SCHEME.dark.sh\"\n[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL" >> ~/.zshrc

    check_success 0 "Create .zshrc"
else
    echo  $(tput setaf 3)WARNING:$(tput sgr 0) .zshrc already exists, will not modify
fi

# base16-gnome-terminal

./shell/base16-gnome-terminal/base16-bespin.dark.sh
echo "$(tput setaf 3)NOTICE: Set the base16 profile as your default in Gnome Terminal.$(tput sgr 0)"

# Create symlinks

echo "Creating symlinks..."
create_link ".gitconfig" ".gitconfig"
create_link ".git-template" ".git-template"
create_link ".vimrc" ".vimrc"
create_link ".vim" ".vim"

# SSH

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Sublime Text 3

if [ ! -e "$HOME/.config/sublime-text-3" ]; then
    # Settings
    mkdir -p "$HOME/.config/sublime-text-3/Packages"
    ln -s "$HOME/dotfiles/st3/User" "$HOME/.config/sublime-text-3/Packages/User"   
    echo "$(tput setaf 3)Sublime text 3 settings symlinked. Download and install Sublime text 3.$(tput sgr 0)"
    
    # Package Control
    # https://sublime.wbond.net/installation
    mkdir -p "$HOME/.config/sublime-text-3/Installed Packages"
    curl -o "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
    echo "$(tput setaf 3)Sublime text 3 Package Control is downloaded and will be installed on first run.$(tput sgr 0)"
else
    echo  $(tput setaf 3)WARNING:$(tput sgr 0) Sublime text 3 already exists, ignored
fi

