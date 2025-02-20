#!/bin/sh
PORT=${PORT:-5000}
echo "Starting LibreTranslate on port ${PORT}"
./venv/bin/libretranslate --host 0.0.0.0 --port ${PORT}
