#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if command -v tree >/dev/null 2>&1; then
  tree -I '.git|DerivedData|build|.build' -a --dirsfirst
else
  find . -path ./.git -prune -o -print | sed 's|[^/]*/| |g'
fi
