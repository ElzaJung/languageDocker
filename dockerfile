# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install LibreTranslate
RUN pip install libretranslate

# Expose the default Render-assigned port
EXPOSE 5000

# Ensure LibreTranslate binds to the correct port
ENTRYPOINT ["sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000}"]
