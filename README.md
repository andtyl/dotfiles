
# About

My dotfiles for a Ubuntu system, with zsh shell and base16 themeing.

# Install

Run:

    ./install.sh

# Update (submodules)

To update submodules

    git submodule foreach git pull origin master

# Sublime Text

## PHP Code Sniffer

- Tools used: https://github.com/squizlabs/PHP_CodeSniffer
- Sublime Package used: https://github.com/benmatselby/sublime-phpcs

Project specific rules:

Edit `x.sublime-project`:

```
{
    "folders":
    [
        {
            "path": "."
        }
    ],
    "settings":
    {
        "phpcs":
        {
            "phpcs_additional_args":
            {
                "--standard": ".../code_rules.xml"
            }
        }
    }
}
```

# TODO

- https://github.com/Lokaltog/powerline
