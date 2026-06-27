#!/usr/bin/env bash
set -euo pipefail

PID_FILE=".cyberflash.pid"
PORT="${PORT:-3000}"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null; then
    echo "CyberFlash is already running (PID $PID) at http://localhost:$PORT"
    exit 0
  else
    rm -f "$PID_FILE"
  fi
fi

if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install --silent
fi

PORT=$PORT node server.js &
echo $! > "$PID_FILE"

echo "CyberFlash started (PID $(cat $PID_FILE)) → http://localhost:$PORT"
