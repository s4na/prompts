#!/bin/bash

# Claude install script
# prompts/claude/CLAUDE.md をコピーします

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
SOURCE_FILE="$PROJECT_ROOT/prompts/claude/CLAUDE.md"
DEST_DIR="$HOME/.claude"
DEST_FILE="$DEST_DIR/CLAUDE.md"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy the file
if [ -f "$SOURCE_FILE" ]; then
  cp "$SOURCE_FILE" "$DEST_FILE"
  echo "✓ Copied CLAUDE.md to $DEST_FILE"
else
  echo "✗ Error: Source file not found at $SOURCE_FILE"
  exit 1
fi
