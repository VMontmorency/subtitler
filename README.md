# Subtitler

Browser-native subtitle generator. Generates accurate SRT/VTT subtitles from any video using Whisper (running in WebAssembly) and ffmpeg.wasm. Everything runs locally in the browser — no uploads, no servers.

**Live app:** https://vmontmorency.github.io/subtitler/

## Features
- Transcribe local files or remote URLs
- SRT and WebVTT export
- Optional subtitle burn-in
- Batch queue
- Six Whisper model sizes (Tiny / Base / Small × multilingual / English-only)
- Chunked transcription for hour-long videos without OOM
- Single-line cues (42 chars max), Netflix-spec timing
- Works on Android Chrome and iOS Safari (mobile-tuned defaults)

## Privacy
Everything runs in your browser. No file ever leaves your device. The only network call is the one-time Whisper model download from HuggingFace.

## Running offline
Download the `Subtitler.zip` from the Releases page (or the latest commit), unzip, and follow the `READ ME — <browser>.txt` file inside. A local Python server is required because browsers block ES modules / workers / fetch when index.html is opened directly via `file://`.
