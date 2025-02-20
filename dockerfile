# Use LibreTranslate as the base image
FROM libretranslate/libretranslate:latest

# Switch to root user to install system dependencies
USER root

# Set working directory
WORKDIR /app

# Install Python, pip, and cleanup cache
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Set writable directory for Argos Translate
ENV ARGOS_TRANSLATE_DATA_DIR=/tmp/argos_data

# Switch back to non-root user
USER 1000

# Copy dependencies and install them
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose ports
EXPOSE 5001 5000

# Start LibreTranslate on port 5001, then start Flask on port 5000
CMD libretranslate --host 0.0.0.0 --port 5001 & gunicorn -b 0.0.0.0:5000 app:app
