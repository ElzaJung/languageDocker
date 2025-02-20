# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install LibreTranslate
RUN pip install libretranslate

# Expose the correct port
EXPOSE 5000

# Explicitly bind to port 5000
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
