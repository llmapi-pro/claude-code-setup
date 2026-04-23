#!/usr/bin/env bash
# Bootstrap: download and run the latest llmapi.pro setup script.
# Source: https://github.com/llmapi-pro/claude-code-setup
set -euo pipefail
exec bash -c "$(curl -fsSL https://llmapi.pro/setup.sh)"
