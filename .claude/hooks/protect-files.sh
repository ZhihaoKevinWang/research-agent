#!/bin/bash
# Block accidental edits to protected files and directories
# Protects: project settings, Study N/ researcher files (outside RAgent works/)

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
# RULE 2: Protect Study N/ researcher files
# All writes inside Study N/ must go through Study N/RAgent works/
# ============================================================
if [[ "$FILE" =~ /Study\ [^/]+/ ]]; then
  if [[ "$FILE" != */RAgent\ works/* ]]; then
    echo "PROTECTED: Writes to Study N/ are only allowed inside 'Study N/RAgent works/'. The researcher's data, scripts, and documents are read-only. Write to $(echo "$FILE" | sed 's|/Study \([^/]*\)/|/Study \1/RAgent works/|') instead." >&2
    exit 2
  fi
fi

exit 0
