FROM libretranslate/libretranslate:latest

ENTRYPOINT []

# Note the path to the LibreTranslate binary:
CMD ["./venv/bin/libretranslate", "--host", "0.0.0.0", "--port", "$PORT", "--load-only", "en,es,ko,zh"]
