# sql-ai plugin: SQL helpers and AI chat using Ollama

# sql_query <database> <SQL>
# Runs the given SQL query on the SQLite database.
sql_query() {
  local db="$1"; shift
  local query="$@"
  if [[ -z $db || -z $query ]]; then
    echo "Usage: sql_query <db> <SQL>" >&2
    return 1
  fi
  sqlite3 "$db" "$query"
}

# ollama_chat <prompt>
# Sends a prompt to the local Ollama LLM and prints the response.
ollama_chat() {
  if ! command -v ollama >/dev/null; then
    echo "ollama command not found" >&2
    return 1
  fi
  local prompt="$*"
  if [[ -z $prompt ]]; then
    echo "Usage: ollama_chat <prompt>" >&2
    return 1
  fi
  ollama run "$prompt"
}
