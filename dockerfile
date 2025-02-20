# Example Dockerfile snippet
FROM python:3.9-slim

WORKDIR /app

# Install dependencies and LibreTranslate
RUN pip install libretranslate

# Expose the default port (adjust if necessary)
EXPOSE 5000

# Set the default command (with optional args)
CMD ["libretranslate"]
