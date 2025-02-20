FROM libretranslate/libretranslate

# Set environment variables (if needed)
ENV LT_HOST=0.0.0.0
ENV LT_PORT=5000
# Add any additional variables like LT_CHAR_LIMIT, LT_DEBUG, etc.

# Expose the port
EXPOSE 5000

# Optionally, override the entrypoint or command
ENTRYPOINT ["./venv/bin/libretranslate", "--host", "0.0.0.0"]
