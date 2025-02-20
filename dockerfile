# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Set the working directory
WORKDIR /app

# Expose the default API port
EXPOSE 5000

# Start LibreTranslate correctly
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
