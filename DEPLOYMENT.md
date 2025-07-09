# Deployment Guide

This guide provides steps to deploy Oh My Zsh across various
systems using chezmoi.

1. Install `chezmoi` from <https://www.chezmoi.io/get>.
2. Clone or download this repository.
3. Run `./tools/chezmoi-install.sh` to initialize chezmoi and apply files.
4. Optionally edit `config/example-config.yaml` to customize plugins
   and settings before applying.

Chezmoi keeps your dotfiles under version control and can sync
changes across multiple machines. After editing your dotfiles,
run `chezmoi apply` to update them on the current device, and
use git to push changes to share with others.

### Using Other Shells

The configuration is optimized for Zsh, but you can source the
plugin scripts manually from other shells if needed. The YAML
configuration can include a `shell` key to indicate which shell
is targeted.
