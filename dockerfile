# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Expose the default API port
EXPOSE 5000

# Start LibreTranslate correctly
ENTRYPOINT ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
