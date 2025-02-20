# Use a base image instead of LibreTranslate's default
FROM python:3.10

# Set working directory
WORKDIR /app

# Install LibreTranslate manually
RUN pip install libretranslate

# Expose the correct port
EXPOSE 5000

# Run LibreTranslate on the correct port
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
