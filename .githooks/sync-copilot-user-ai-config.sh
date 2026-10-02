#!/usr/bin/env sh
set -eu

branch_name=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)
if [ "$branch_name" != "main" ]; then
  exit 0
fi

repo_root=$(git rev-parse --show-toplevel)
copilot_user_root="${COPILOT_USER_ROOT:-$HOME/.copilot}"

# Sync user-level instructions and skills for Copilot Agent Host.
for dir_name in instructions skills; do
  source_dir="$repo_root/$dir_name"
  if [ ! -d "$source_dir" ]; then
    continue
  fi

  case "$dir_name" in
    instructions)
      target_dir="${COPILOT_USER_INSTRUCTIONS_DIR:-$copilot_user_root/instructions}"
      ;;
    skills)
      target_dir="${COPILOT_USER_SKILLS_DIR:-$copilot_user_root/skills}"
      ;;
  esac

  mkdir -p "$target_dir"

  if [ "$dir_name" = skills ]; then
    cp -R "$source_dir"/. "$target_dir"/
  else
    for source_file in "$source_dir"/*; do
      [ -f "$source_file" ] || continue
      file_name=$(basename "$source_file")
      cp -f "$source_file" "$target_dir/$file_name"
    done
  fi

  echo "Synced $dir_name to: $target_dir"
done
