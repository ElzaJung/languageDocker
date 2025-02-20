# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install LibreTranslate
RUN pip install libretranslate

# Expose a dynamic port
EXPOSE 5000

# Start LibreTranslate using the dynamic port assigned by Render
CMD ["sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000}"]
