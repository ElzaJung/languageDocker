# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Expose the API port
EXPOSE 5000

# Start LibreTranslate correctly
CMD ["libretranslate"]
