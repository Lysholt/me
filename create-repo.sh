#!/usr/bin/env bash
# Script to create a new GitHub repository
# Usage: ./create-repo.sh <repo-name> [description] [--private]

set -euo pipefail

REPO_NAME="${1:-}"
DESCRIPTION="${2:-}"
VISIBILITY="public"

if [[ -z "$REPO_NAME" ]]; then
  echo "Usage: $0 <repo-name> [description] [--private]"
  exit 1
fi

if [[ "${3:-}" == "--private" ]]; then
  VISIBILITY="private"
fi

# Requires gh CLI: https://cli.github.com/
if ! command -v gh &>/dev/null; then
  echo "Error: gh CLI not found. Install it from https://cli.github.com/"
  exit 1
fi

echo "Creating repository: Lysholt/$REPO_NAME"
gh repo create "Lysholt/$REPO_NAME" \
  --$VISIBILITY \
  --description "$DESCRIPTION" \
  --clone

echo "Done! Repository created at https://github.com/Lysholt/$REPO_NAME"
