# DevOps Extra plugin for Oh My Zsh
# Provides utility functions and aliases for DevOps workflows.

# Ensure dependencies
command -v fzf >/dev/null 2>&1 || echo "[devops-extra] fzf not found. Install for fuzzy search." >&2

# fuzzy_find - uses fzf to locate files or directories
fuzzy_find() {
  local target
  target=$(find . -type f -o -type d 2>/dev/null | fzf --height 40% --reverse)
  [[ -n $target ]] && print -- "$target"
}

# gpt_complete - call OpenAI API for code or text completion
# Requires OPENAI_API_KEY environment variable
# Usage: gpt_complete "prompt"
gpt_complete() {
  local prompt="$1"
  if [[ -z $OPENAI_API_KEY ]]; then
    echo "OPENAI_API_KEY not set" >&2
    return 1
  fi
  curl -s https://api.openai.com/v1/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{"model":"text-davinci-003","prompt":"'$prompt'","max_tokens":64}' | jq -r '.choices[0].text'
}

# git_repo - manage git repositories quickly
# Usage: git_repo init|clone|addremote <args>

git_repo() {
  case "$1" in
    init)
      git init && echo "Initialized git repository";;
    clone)
      git clone "$2";;
    addremote)
      git remote add origin "$2";;
    *)
      echo "Usage: git_repo {init|clone <url>|addremote <url>}";;
  esac
}

# scaffold_from_tree - create files and dirs from tree-like text
# Example input:
# dir1/
#   file1
#   subdir/
#     file2
scaffold_from_tree() {
  local line indent path stack=()
  while IFS= read -r line; do
    indent="${line%%[^ ]*}" # leading spaces
    line="${line## }"       # trim leading spaces
    if [[ $line == */ ]]; then
      mkdir -p "$line"
      stack+=("$line")
    else
      mkdir -p "${stack[-1]:-.}"
      touch "${stack[-1]:-.}/$line"
    fi
  done
}

# clone_all_github_repos - requires gh CLI and GitHub auth
clone_all_github_repos() {
  gh repo list "$1" --limit 1000 --json sshUrl -q '.[].sshUrl' | xargs -n1 git clone
}

# quick aliases
alias uvx='uvx'
alias e2b='e2b'

# Database helpers
pg_start() { pg_ctlcluster "$1" start; }

