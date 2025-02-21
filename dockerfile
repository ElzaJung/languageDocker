FROM libretranslate/libretranslate

# If you want a default port (Render will override it, but it's a good fallback)
ARG PORT=5000
ENV PORT=${PORT}

# Expose the port
EXPOSE ${PORT}

# Override the base image's entrypoint
ENTRYPOINT []

# Copy and use your startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
