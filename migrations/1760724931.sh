echo "Change to openai-codex instead of openai-codex-bin"

if blackarch-pkg-present openai-codex-bin; then
    blackarch-pkg-drop openai-codex-bin
    blackarch-pkg-add openai-codex
fi
