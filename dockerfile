FROM libretranslate/libretranslate

# Copy your startup script into the container
COPY startup.sh /app/startup.sh

# Make sure the script is executable
RUN chmod +x /app/startup.sh

# Use the startup script as the container's entrypoint
CMD ["/app/startup.sh"]
