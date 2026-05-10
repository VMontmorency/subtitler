@echo off
REM Double-click this file to launch Subtitler in your default browser.
REM It starts a tiny local web server in this folder, because browsers
REM block modern web apps when opened directly via file:// — they require http://.

cd /d "%~dp0"

set PORT=8765
set URL=http://localhost:%PORT%/index.html

echo Starting Subtitler at %URL%
echo Keep this window open while you use the app.
echo Close this window when you're done.
echo.

REM Open the browser
start "" "%URL%"

REM Try Python (most common). If unavailable, suggest install.
where python >nul 2>nul
if %errorlevel% == 0 (
  python -m http.server %PORT%
) else (
  where py >nul 2>nul
  if %errorlevel% == 0 (
    py -m http.server %PORT%
  ) else (
    echo ERROR: Python is not installed.
    echo Install it from https://www.python.org/downloads/ and re-run this file.
    pause
    exit /b 1
  )
)
