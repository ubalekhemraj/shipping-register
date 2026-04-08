FROM python:3.13-slim

# Install system dependencies required by Reflex, PostgreSQL, and nginx
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    build-essential \
    libpq-dev \
    nginx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose single public port (nginx reverse proxy)
EXPOSE 80

# Run startup script: db init/migrate + reflex + nginx
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
