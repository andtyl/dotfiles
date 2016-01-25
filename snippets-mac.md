# Mac Snippets

## Setup

- [Setting up iTerm2 with oh-my-zsh and powerline on OSX](http://www.xplatform.rocks/2015/05/07/setting-up-iterm2-with-oh-my-zsh-and-powerline-on-osx/)
- [Meslo LG M DZ Regular for Powerline.otf (nice terminal font)](https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.otf)

## Keystrokes

`shift + alt + 7` - print '\'
`alt + 7` - print '|'
`shift + option` - maximize window
`ctrl + command + f` - fullscreen window
`ctrl + ←/→` - switch desktop

## Tweaks

### Window maximize animation

disable: `defaults write -g NSWindowResizeTime -float 0.003`
enable: `defaults delete -g NSWindowResizeTimes`

### Set default program for file type

- 1 right click your file 
- 2 choose "Get Info"
- 3 in the popup find the "Open with" strip (this is by default closed) and open it
- 4 from the drop down choose the program you want to open that type of file
- 5 click "Change all..."
