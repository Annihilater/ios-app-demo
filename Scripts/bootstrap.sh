#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "==> ProxyClient bootstrap"
echo "Root: $ROOT"

if ! command -v xcodebuild >/dev/null 2>&1; then
  echo "WARN: xcodebuild not found. Install Xcode from the App Store."
else
  echo "Xcode: $(xcodebuild -version | tr '\n' ' ')"
fi

if ! command -v swift >/dev/null 2>&1; then
  echo "WARN: swift not found."
else
  echo "Swift: $(swift --version 2>&1 | head -n 1)"
fi

echo "==> Directory check"
for d in App PacketTunnel Shared Docs Configs Scripts; do
  if [[ -d "$d" ]]; then
    echo "  OK  $d/"
  else
    echo "  MISSING  $d/"
    exit 1
  fi
done

echo "==> Done. Next: create Xcode project with App + PacketTunnel targets."
