#!/bin/sh
# Basic validation script for Oh My Zsh
# Checks syntax of zsh plugins and themes

if ! command -v zsh >/dev/null; then
  echo "zsh is required to run tests" >&2
  exit 1
fi

set -e
for file in ./oh-my-zsh.sh ./lib/*.zsh ./plugins/*/*.plugin.zsh ./plugins/*/_* ./themes/*.zsh-theme; do
  zsh -n "$file"
done

echo "Syntax check passed"
