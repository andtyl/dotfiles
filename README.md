
Currently customized for Mac OS. There is a branch for Linux from when Ubuntu was my main OS.

# Install

Not sure if this script still works...

Run:

    ./install.sh

# Update (submodules)

To update submodules

    git submodule foreach git pull origin master

# Notes

## PHP Code Sniffer for Sublime Text

**Tool used:** https://github.com/squizlabs/PHP_CodeSniffer
**Sublime Package used:** https://github.com/benmatselby/sublime-phpcs

Setting project specific rules:

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

