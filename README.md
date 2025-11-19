# prompts

## Claude設定ファイルのインストール

このリポジトリには Claude 用の設定ファイルが含まれています。

### 使い方

install.sh スクリプトを実行して、Claude設定ファイルをインストールします：

```bash
./src/claude/install.sh
```

このコマンドは `prompts/claude/CLAUDE.md` を `~/.claude/CLAUDE.md` にコピーします。

### 詳細

- **ソースファイル:** `prompts/claude/CLAUDE.md`
- **インストール先:** `~/.claude/CLAUDE.md`
- **宛先ディレクトリ:** スクリプトが自動で作成します（存在しない場合）
