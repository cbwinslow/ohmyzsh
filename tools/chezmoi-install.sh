#!/bin/sh
# Install Oh My Zsh configuration using chezmoi
if ! command -v chezmoi >/dev/null; then
  echo "chezmoi is required: https://www.chezmoi.io/get" >&2
  exit 1
fi
# init from repo and apply
chezmoi init --source="$(pwd)" && chezmoi apply
