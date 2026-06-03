#!/usr/bin/env bash
set -euo pipefail

# Quit any running instance, rebuild/repackage the signed dist bundle, then launch it.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/dist/Display Anchor.app"

# The packaged executable name (see package_app.sh EXECUTABLE_NAME).
pkill -x DisplayAnchor 2>/dev/null || true

INSTALL_AFTER_BUILD=0 LAUNCH_AFTER_INSTALL=0 "$ROOT_DIR/Scripts/package_app.sh"

/usr/bin/open "$APP_DIR"
echo "Launched $APP_DIR"
