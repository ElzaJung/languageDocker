# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Expose the port
EXPOSE 5000

# Start LibreTranslate automatically
CMD ["libretranslate", "--port", "5000"]
