#!/bin/bash
# Block accidental edits to protected files and directories
# Protects: raw data, settings

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
FILE=""

# Extract file path based on tool type
if [ "$TOOL" = "Edit" ] || [ "$TOOL" = "Write" ]; then
  FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
fi

# No file path = not a file operation, allow
if [ -z "$FILE" ]; then
  exit 0
fi

BASENAME=$(basename "$FILE")

# ============================================================
# RULE 1: Protect specific files by name
# ============================================================
PROTECTED_FILES=(
  "settings.json"
  "references.bib"
)

for PATTERN in "${PROTECTED_FILES[@]}"; do
  if [[ "$BASENAME" == "$PATTERN" ]]; then
    echo "Protected file: $BASENAME. Edit manually or remove protection in .claude/hooks/protect-files.sh" >&2
    exit 2
  fi
done

# ============================================================
# RULE 2: Protect data/raw/ directory — NEVER modify raw data
# ============================================================
if [[ "$FILE" == */data/raw/* ]]; then
  echo "PROTECTED: data/raw/ is read-only. Raw data must never be modified. Use data/processed/ for cleaned data." >&2
  exit 2
fi

exit 0
