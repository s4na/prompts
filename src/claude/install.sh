#!/bin/bash

# Claude install script
# prompts/claude/CLAUDE.md をコピーします

set -e

GITHUB_RAW_URL="https://raw.githubusercontent.com/s4na/prompts/main/prompts/claude/CLAUDE.md"
DEST_DIR="$HOME/.claude"
DEST_FILE="$DEST_DIR/CLAUDE.md"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# First, try to use local file if running from the project directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE_FILE="$PROJECT_ROOT/prompts/claude/CLAUDE.md"

if [ -f "$SOURCE_FILE" ]; then
  # Local file exists, copy it
  cp "$SOURCE_FILE" "$DEST_FILE"
  echo "✓ Copied CLAUDE.md to $DEST_FILE"
elif command -v curl &> /dev/null; then
  # Fall back to downloading from GitHub
  echo "Downloading CLAUDE.md from GitHub..."
  if curl -fsSL "$GITHUB_RAW_URL" -o "$DEST_FILE"; then
    echo "✓ Downloaded CLAUDE.md to $DEST_FILE"
  else
    echo "✗ Error: Failed to download from $GITHUB_RAW_URL"
    exit 1
  fi
else
  echo "✗ Error: Source file not found and curl is not available"
  exit 1
fi
