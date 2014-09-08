
# Install

## zsh

`sudo apt-get install zsh`

`chsh -s /bin/zsh`

## oh-my-zsh

`git clone https://github.com/robbyrussell/oh-my-zsh.git`

`cp ~/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc`

## dircolors

`git clone https://github.com/seebi/dircolors-solarized.git`

Add to .zshrc:

``eval `dircolors ~/dircolors-solarized/dircolors.256dark` ``

# Config 

Run:

`./makesyminks.sh`

Add to .zshrc:

`export PATH=~/dotfiles/bin:$PATH`

# TODO

- GIT submodules
