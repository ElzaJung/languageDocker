FROM libretranslate/libretranslate:latest

# Switch to root so we can set file permissions
USER root

# Remove the base image's ENTRYPOINT 
# (otherwise Docker tries to run "libretranslate" + your script)
ENTRYPOINT []

# Copy your script into the container
COPY start.sh /start.sh

# Make your startup script executable
RUN chmod +x /start.sh

# Switch back to the non-root user (for best security practices)
# The default non-root user in the LibreTranslate image is "translator"
USER translator

# Finally, specify your custom CMD
CMD ["/start.sh"]
