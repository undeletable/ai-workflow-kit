#!/usr/bin/env sh
set -eu

branch_name=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)
if [ "$branch_name" != "main" ]; then
  exit 0
fi

repo_root=$(git rev-parse --show-toplevel)

if [ -n "${APPDATA:-}" ]; then
  vscode_user_root="$APPDATA/Code/User"
else
  vscode_user_root="$HOME/.config/Code/User"
fi

# Sync any known AI customization directories that exist in this repository.
for dir_name in prompts instructions chatmodes agents skills; do
  source_dir="$repo_root/$dir_name"
  if [ ! -d "$source_dir" ]; then
    continue
  fi

  target_dir=""
  case "$dir_name" in
    prompts)
      target_dir="${VSCODE_USER_PROMPTS_DIR:-}"
      ;;
    instructions)
      target_dir="${VSCODE_USER_INSTRUCTIONS_DIR:-}"
      ;;
    chatmodes)
      target_dir="${VSCODE_USER_CHATMODES_DIR:-}"
      ;;
    agents)
      target_dir="${VSCODE_USER_AGENTS_DIR:-}"
      ;;
    skills)
      target_dir="${VSCODE_USER_SKILLS_DIR:-}"
      ;;
  esac

  if [ -z "$target_dir" ]; then
    target_dir="$vscode_user_root/$dir_name"
  fi

  mkdir -p "$target_dir"

  for source_file in "$source_dir"/*; do
    [ -f "$source_file" ] || continue
    file_name=$(basename "$source_file")
    cp -f "$source_file" "$target_dir/$file_name"
  done

  echo "Synced $dir_name to: $target_dir"
done
