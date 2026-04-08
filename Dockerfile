FROM python:3.13-slim

# Install system dependencies required by Reflex and PostgreSQL
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose ports
EXPOSE 3000 8000

# Run the app
CMD ["sh", "-c", "reflex db init && reflex db migrate && reflex run --env prod"]
