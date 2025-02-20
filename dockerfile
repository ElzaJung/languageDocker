# Use the official LibreTranslate image
FROM libretranslate/libretranslate:latest

# Expose port 5000
EXPOSE 5000

# Run LibreTranslate on port 5000
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
