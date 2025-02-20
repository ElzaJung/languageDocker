# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Expose the required port
EXPOSE 5000

# Start LibreTranslate with dynamic port binding
ENTRYPOINT ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
