# Functions Overview

This document explains the purpose of the additional functions
included with the custom plugins and scripts in this repository.

## sql-ai plugin

### sql_query
Runs a SQL statement against a specified SQLite database.
Example:
```shell
sql_query my.db "SELECT * FROM users;"
```

### ollama_chat
Uses `ollama` to run a prompt through a local language model.
Example:
```shell
ollama_chat "Explain Oh My Zsh"
```

## devops-extra plugin
See `plugins/devops-extra/README.md` for the list of helper
functions such as `fuzzy_find` and `gpt_complete`.

## run_tests.sh
Validates the syntax of core scripts, plugins and themes using
`zsh -n`.

## chezmoi-install.sh
Sets up Oh My Zsh with chezmoi to sync your dotfiles across devices.
