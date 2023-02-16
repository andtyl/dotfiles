
# ⚙️  My Dotfiles

## Installation

### Clone
```
cd ~
git clone https://github.com/andtyl/dotfiles
```

### Zsh / Oh My Zsh
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Git Submodules
```
cd dotfiles
git submodule update --init
```

### Symlinks
```
cd ~
ln -s dotfiles/.gitconfig
ln -s dotfiles/.gitignore_global
ln -s dotfiles/.vim
ln -s dotfiles/.vimrc
ln -s dotfiles/.zshrc
```

### Create dirs
```
mkdir .vimtmp
```

### Install terminal font

vim-airline requries a font that supports symbols, for example: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)

