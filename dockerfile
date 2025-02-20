FROM libretranslate/libretranslate:latest
EXPOSE 5000
CMD ["sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000}"]
