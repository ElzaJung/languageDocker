# Use the official LibreTranslate image as the base
FROM libretranslate/libretranslate:latest

# Switch to root user to install system dependencies
USER root

# Set the working directory
WORKDIR /app

# Install Python and required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Set environment variables to avoid permission issues
ENV PIP_NO_CACHE_DIR=off \
    PIP_BREAK_SYSTEM_PACKAGES=1 \
    PIP_ROOT_USER_ACTION=ignore

# Copy dependencies and install them as root
COPY requirements.txt .
RUN pip3 install --no-cache-dir --break-system-packages --user -r requirements.txt

# Switch back to non-root user (important for security)
USER 1000

# Copy application files
COPY . .

# Expose ports
EXPOSE 5001 5000

# Start LibreTranslate on port 5001, then start Flask on 5000
CMD libretranslate --host 0.0.0.0 --port 5001 & gunicorn -b 0.0.0.0:5000 app:app
