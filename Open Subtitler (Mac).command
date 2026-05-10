#!/bin/bash
# Double-click this file to launch Subtitler in your default browser.
# It starts a tiny local web server in this folder, because Safari and Chrome
# block modern web apps (workers, modules, fetch) when opened directly via
# file:// — they require http://.

cd "$(dirname "$0")"

PORT=8765
URL="http://localhost:$PORT/index.html"

# Find an available port if 8765 is busy
while lsof -i :$PORT >/dev/null 2>&1; do
  PORT=$((PORT + 1))
  URL="http://localhost:$PORT/index.html"
done

echo "Starting Subtitler at $URL"
echo "Keep this Terminal window open while you use the app."
echo "Close this window or press Ctrl+C when you're done."
echo ""

# Open the browser after a short delay so the server is ready
( sleep 1 && open "$URL" ) &

# Try Python 3 first, fall back to Python 2
if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server $PORT
elif command -v python >/dev/null 2>&1; then
  python -m SimpleHTTPServer $PORT
else
  echo "ERROR: Python is not installed. Install it from python.org and try again."
  read -p "Press Enter to close..."
  exit 1
fi
