#!/bin/sh

echo "Starting LibreTranslate on port: ${PORT}"

exec ./venv/bin/libretranslate --host 0.0.0.0 --port "${PORT}" --load-only en,es,ko,zh
