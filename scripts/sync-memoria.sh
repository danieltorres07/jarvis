#!/bin/bash
# Sincroniza ~/.claude/projects/-Users-danieltorres/memory/*.md pro repo do Jarvis (github.com/danieltorres07/jarvis)
# Disparado por hook PostToolUse em Write|Edit. So age se o arquivo tocado for da pasta de memoria.

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_response.filePath // empty')

MEMORY_DIR="/Users/danieltorres/.claude/projects/-Users-danieltorres/memory"
REPO_DIR="/Users/danieltorres/jarvis-repo"

case "$FILE_PATH" in
  "$MEMORY_DIR"/*.md) ;;
  *) exit 0 ;;
esac

mkdir -p "$REPO_DIR/memoria"
cp "$MEMORY_DIR"/*.md "$REPO_DIR/memoria/" 2>/dev/null

cd "$REPO_DIR" || exit 0
git add memoria 2>/dev/null
if ! git diff --cached --quiet 2>/dev/null; then
  git commit -q -m "Sync automatico da memoria ($(basename "$FILE_PATH"))" 2>/dev/null
fi

# O robo da nuvem (rotina das 7h) tambem escreve nesse mesmo repo
# (memoria/resumo-hoje.txt), entao o remoto pode ter avancado desde o
# ultimo push daqui. Busca e funde antes de tentar subir, pra nunca mais
# ficar travado em silencio (ja aconteceu, 116 commits presos sem avisar).
git fetch -q origin main 2>/dev/null
git merge -q origin/main --no-edit -m "Merge automatico (sync memoria)" 2>/dev/null
git push -q origin main 2>>"$REPO_DIR/sync-memoria.log"
exit 0
