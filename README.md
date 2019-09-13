# .Radrc
Very rad .vimrc with batteries included

## Bundle installation (requires git)
Use this shell command to install configuration under ~/.vim with .vimrc symlink
```
curl --location https://github.com/dkz/.radrc/raw/master/install.sh | sh
```
This script will ask you whether you like to add certain customizations like
vim-airline, and then installs plugins with `:PluginInstall`.

## Minimal installation
Imagine not being able to replicate your exact .vimrc on the remote environment
because it has no git installed. This script will fetch only .vimrc file from
configuration (no vundle plugins, no keybinds, no colorschemes).

```
curl --location https://github.com/dkz/.radrc/raw/master/install-minimal.sh | sh
```
