# Radical RC

Simple and easy to manage vim configuration under 200 lines of vim script.
Primary introduced to simplify vim configuration on multiple hosts.
Be that a working PC, arbitrary remote host, backup server, production system,
you can fork and clone this repo to install and synchronize commonly used vim options.

- Concise vim configuration mostly with widely adopted feature toggles
- Opt-out plugins (via Vundle)
- Opt-out custom key bindings
- Opt-out git
- Split into regular vim configuration under git and .local files that aren't synchronized
- Installation scripts for easy deployment locally and remotely

## Bundle installation (requires git)

```
curl --location https://github.com/dkz/.radrc/raw/master/install.sh | sh
```

This script will ask you whether you like to add certain plugins like
vim-airline, and then installs them with `:PluginInstall`.

## Minimal installation

```
curl --location https://github.com/dkz/.radrc/raw/master/install-minimal.sh | sh
```

This script fetches only the `.vimrc` file, ignoring git, plugins and color schemes.
