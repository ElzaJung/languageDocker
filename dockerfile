FROM libretranslate/libretranslate:latest

ENTRYPOINT []

CMD ["sh", "-c", "./venv/bin/libretranslate --host 0.0.0.0 --port ${PORT:-5000} --load-only en,es,ko,zh"]
