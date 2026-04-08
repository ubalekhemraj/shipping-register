#!/bin/sh
set -e

# Initialize and migrate database
reflex db init
reflex db migrate

# Start Reflex app in background (frontend :3000, backend :8000)
reflex run --env prod &

# Wait for both ports to be ready before starting nginx
echo "Waiting for Reflex services to start..."
for i in $(seq 1 60); do
    if curl -sf http://127.0.0.1:8000/ > /dev/null 2>&1 && \
       curl -sf http://127.0.0.1:3000/ > /dev/null 2>&1; then
        echo "Reflex services are up."
        break
    fi
    sleep 2
done

# Copy nginx config and start nginx in foreground
cp /app/nginx.conf /etc/nginx/nginx.conf
nginx -g "daemon off;"
