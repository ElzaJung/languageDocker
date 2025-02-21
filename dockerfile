FROM libretranslate/libretranslate:latest

# Switch to root so we can set file permissions
USER root

# Remove the base image's ENTRYPOINT 
# (otherwise Docker tries to run "libretranslate" + your script)
ENTRYPOINT []

# Copy script into the container
COPY start.sh /start.sh

# Debug: Check that the file actually copied
RUN echo "Contents of /start.sh:" && cat /start.sh

RUN chmod +x /start.sh

# Debug: Check permissions after chmod
RUN echo "Permissions of /start.sh:" && ls -l /start.sh

# Switch back to the non-root user (for best security practices)
# The default non-root user in the LibreTranslate image is "translator"
USER translator

# Finally, specify your custom CMD
CMD ["/start.sh"]
