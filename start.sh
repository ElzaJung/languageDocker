#!/bin/sh

# Print some info (optional):
echo "Starting LibreTranslate on port: ${PORT}"

# Replace the shell with the actual LibreTranslate process:
exec ./venv/bin/libretranslate --port "${PORT}" --load-only en,es,ko,zh
