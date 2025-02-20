FROM python:3.8-slim

# Install system dependencies for building Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Upgrade pip to ensure compatibility
RUN pip install --upgrade pip

# Install LibreTranslate in editable mode
RUN pip install -e .

CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
