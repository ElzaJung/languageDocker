# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install LibreTranslate
RUN pip install libretranslate

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the correct port
EXPOSE 5000

# Run the script
CMD ["/start.sh"]
