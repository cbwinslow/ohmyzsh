# Deploying with chezmoi

This repository can be managed as a dotfiles source with
[chezmoi](https://www.chezmoi.io). The `tools/chezmoi-install.sh`
script initializes chezmoi pointing at this directory and applies
all configuration files.

You can customize the installation using the YAML file in `config/`.
Run:
```bash
./tools/chezmoi-install.sh
```
