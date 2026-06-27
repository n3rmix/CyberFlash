#!/usr/bin/env bash
set -euo pipefail

PID_FILE=".cyberflash.pid"

if [ ! -f "$PID_FILE" ]; then
  echo "CyberFlash is not running (no PID file found)."
  exit 0
fi

PID=$(cat "$PID_FILE")

if kill -0 "$PID" 2>/dev/null; then
  kill "$PID"
  rm -f "$PID_FILE"
  echo "CyberFlash stopped (PID $PID)."
else
  rm -f "$PID_FILE"
  echo "CyberFlash was not running (stale PID file removed)."
fi
