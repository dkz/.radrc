# .litrc
.vimrc that is lit af

## Bundle installation (requires git)
Use this shell command to install configuration under ~/.vim with .vimrc symlink
```
curl --location https://github.com/dkz/.litrc/raw/master/install.sh | sh
```
Then run :PluginInstall to let vundle fetch the rest of plugins.
Scripts sets up some usefull defaults in .local files inside ~/.vim as well.

## Minimal installation
Imagine not being able to replicate your exact .vimrc on the remote environment
because it has no git installed. This script will fetch only .vimrc file from
configuration (no vundle plugins, no keybinds, no colorschemes).

```
curl --location https://github.com/dkz/.litrc/raw/master/install-minimal.sh | sh
```
