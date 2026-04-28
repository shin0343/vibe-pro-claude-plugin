#!/bin/bash
# vibe-pro PostToolUse hook
# Fires after Write, Edit, or MultiEdit. If the written file is a recognized
# code file, injects a reminder into the conversation to run the review skills.

INPUT=$(cat)

# Extract file_path from the hook payload
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

# Exit silently if no file path found
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Recognized code file extensions
CODE_EXTENSIONS="js|jsx|ts|tsx|mjs|cjs|py|rb|go|java|cs|cpp|c|php|rs|swift|kt|scala|sh|bash|sql|vue|svelte"

# Extract and lowercase the extension
EXTENSION=$(echo "$FILE_PATH" | sed 's/.*\.//' | tr '[:upper:]' '[:lower:]')

# Exit silently for non-code files (markdown, config, assets, etc.)
if ! echo "$EXTENSION" | grep -qE "^($CODE_EXTENSIONS)$"; then
  exit 0
fi

FILENAME=$(basename "$FILE_PATH")

# Output systemMessage JSON — Claude Code injects this into the conversation context
printf '{"systemMessage": "📋 vibe-pro: `%s` 작성 완료. `/vibe-pro:review`로 8가지 원칙 검토, `/vibe-pro:security`로 OWASP 보안 감사를 실행할 수 있습니다."}\n' "$FILENAME"
