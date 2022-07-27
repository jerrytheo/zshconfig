# A useful Zsh configuration file.

- Been designed for Arch and Ubuntu.
- Uses [zplug](https://github.com/zplug/zplug) as the plugin manager.

> Replaced antigen as it is no longer maintained.

## Instructions
1. Install zplug using one of the commands below:
```zsh
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
$ sudo apt install zplug
```
2. Clone and initialize the repo.
```zsh
$ git clone https://github.com/jerrytheo/zshconfig.git $HOME/.zsh
$ ln -s $HOME/.zsh/zshrc $HOME/.zshrc
```

> Link up to date as of 13 April, 21.

## Plugins

### Oh-My-Zsh Plugins

| Plugin                              | Description                           |
| ----------------------------------- | ------------------------------------- |
| `battery`                           | convenient functions for prompt.      |
| `colored-man-pages`                 | man pages color coded.                |
| `colorize`                          | colorized cat.                        |
| `cp`                                | cp with progress (rsync)              |
| `vi-mode`                           | increase zsh vi-like functionality.   |
| `autojump`                          | faster directory traversing.          |
| `autopep8`                          | completion for the pep8 tool.         |
| `command-not-found`                 | suggest new command.                  |
| `debian`                            | aliases for apt.                      |
| `extract`                           | swiss army knife for file extraction. |
| `git`                               | aliases and functions for git.        |
| `jsontools`                         | display/validate JSON.                |
| `npm`                               | completion for npm.                   |
| `pip`                               | clean cache, list clean pkgs.         |
| `python`                            | pyfind, pyclean, pygrep.              |
| `sudo`                              | put sudo in front of command.         |
| `web-search`                        | search online.                        |

> `autojump` requires the package to be installed.

### Miscellaneous Plugins

| Plugin                              | Description                           |
| ----------------------------------- | ------------------------------------- |
| `chrissicool/zsh-256color`          | 256 colors on terminal.               |
| `hlissner/zsh-autopair`             | easier delimiter handling.            |
| `djui/alias-tips`                   | specifies if alias defined.           |
| `zsh-users/zsh-syntax-highlighting` | syntax coloring                       |
| `zsh-users/zsh-autosuggestions`     | autosuggest                           |

## License
Licensed under MIT License. See LICENSE.