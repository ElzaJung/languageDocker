# Use the official LibreTranslate image as the base
FROM libretranslate/libretranslate:latest

# Set the working directory
WORKDIR /app

# Install Python and required packages
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy dependencies and install them
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose ports (5000 for LibreTranslate, 8080 for Flask API)
EXPOSE 5000
EXPOSE 8080

# Start LibreTranslate in the background, then start Flask API
CMD libretranslate --host 0.0.0.0 --port 5000 & gunicorn -b 0.0.0.0:8080 app:app
