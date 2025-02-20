# Use Python as the base image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y python3-venv

# Create a virtual environment
RUN python -m venv /opt/venv

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip inside the virtual environment
RUN pip install --upgrade pip

# Install LibreTranslate inside the virtual environment
RUN pip install libretranslate

# Expose the correct port
ENV PORT=5000
EXPOSE 5000

# Start LibreTranslate using the assigned port
CMD ["sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000}"]
