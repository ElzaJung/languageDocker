# Use an official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY . .

# Expose port 5000 for LibreTranslate and 8080 for Flask
EXPOSE 5000
EXPOSE 8080

# Start LibreTranslate in the background and then run Flask
CMD libretranslate --host 0.0.0.0 --port 5000 & gunicorn -b 0.0.0.0:8080 app:app
