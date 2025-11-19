#!/bin/bash

# Claude install script
# prompts/claude/CLAUDE.md をカレントディレクトリにコピーするスクリプト
#
# 使用方法:
#   1. ローカルプロジェクトから実行:
#      ./src/claude/install.sh
#
#   2. curl でダウンロード実行:
#      curl -fsSL https://raw.githubusercontent.com/s4na/prompts/main/src/claude/install.sh | bash
#
# 処理の流れ:
#   - ローカルにソースファイルがある場合: ローカルファイルからコピー
#   - ローカルにない場合かつ curl が利用可能: GitHub から CLAUDE.md をダウンロード
#   - それ以外: エラーで終了

set -e

# GitHub Raw URL（curl でダウンロードする際に使用）
GITHUB_RAW_URL="https://raw.githubusercontent.com/s4na/prompts/main/prompts/claude/CLAUDE.md"

# コピー先ファイル（実行したシェルのカレントディレクトリ）
DEST_FILE="./CLAUDE.md"

# ローカルファイルの探索
# スクリプトの位置から相対パスでプロジェクトルートを特定し、ソースファイルを探す
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE_FILE="$PROJECT_ROOT/prompts/claude/CLAUDE.md"

# ローカルファイルが存在するかチェック
if [ -f "$SOURCE_FILE" ]; then
  # ローカルファイルが見つかった場合: プロジェクトからコピー
  cp "$SOURCE_FILE" "$DEST_FILE"
  echo "✓ Copied CLAUDE.md to $DEST_FILE"
elif command -v curl &> /dev/null; then
  # ローカルファイルがない場合かつ curl が利用可能: GitHub からダウンロード
  echo "Downloading CLAUDE.md from GitHub..."
  if curl -fsSL "$GITHUB_RAW_URL" -o "$DEST_FILE"; then
    echo "✓ Downloaded CLAUDE.md to $DEST_FILE"
  else
    echo "✗ Error: Failed to download from $GITHUB_RAW_URL"
    exit 1
  fi
else
  # ローカルファイルがなく、curl も利用できない場合: エラー
  echo "✗ Error: Source file not found and curl is not available"
  exit 1
fi
