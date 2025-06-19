# devops-extra plugin

This plugin provides a set of helper functions useful for DevOps workflows.

## Features
- `fuzzy_find`: fuzzy search files and directories using **fzf**.
- `gpt_complete`: call the OpenAI API for quick code or text completion.
- `git_repo`: lightweight git repository management helper.
- `scaffold_from_tree`: create files and directories from indented tree text.
- `clone_all_github_repos`: clone all repositories for a GitHub user via **gh** CLI.
- Aliases for `uvx` and `e2b` executables.
- `pg_start`: start a PostgreSQL cluster using `pg_ctlcluster`.

Dependencies for some commands include `fzf`, `gh`, `jq`, and a valid `OPENAI_API_KEY` for API access.
