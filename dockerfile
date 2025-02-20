# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install LibreTranslate
RUN pip install libretranslate

# Expose the default port for LibreTranslate
ENV PORT=5000
EXPOSE 5000

# Start LibreTranslate and ensure it listens on all interfaces
CMD ["sh", "-c", "libretranslate --host 0.0.0.0 --port $PORT"]
