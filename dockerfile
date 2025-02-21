FROM libretranslate/libretranslate:latest

ENTRYPOINT []
CMD ["sh", "-c", "echo 'Starting...' && libretranslate --host 0.0.0.0 --port ${PORT} --load-only en,es,ko,zh && sleep 300"]
