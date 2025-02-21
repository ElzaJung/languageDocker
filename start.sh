#!/bin/sh
set -x  # prints each command as it runs for debugging

echo "Starting LibreTranslate on port: ${PORT}"

./venv/bin/libretranslate --host 0.0.0.0 --port "${PORT}" --load-only en,es,ko,zh
echo "LibreTranslate exited with $?"
sleep 300
