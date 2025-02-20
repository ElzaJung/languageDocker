FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy your code
COPY . /app

# Install LibreTranslate (editable mode if you plan on making changes)
RUN pip install -e .

# If you want the language models downloaded at build time, use this build argument.
# For Render, you can either modify the Dockerfile to include:
# ARG with_models=false
# RUN if [ "$with_models" = "true" ]; then <download_models_command>; fi

# Expose the port (Render provides the PORT env var)
ENV PORT=5000
EXPOSE 5000

# Ensure the API binds to 0.0.0.0 so it’s reachable externally
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
