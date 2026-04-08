import reflex as rx
import os
from reflex.plugins.sitemap import SitemapPlugin

# Detect environment
is_prod = os.environ.get("RAILWAY_ENVIRONMENT_NAME") == "production"

# Database URL: PostgreSQL on Railway, SQLite locally
if is_prod:
    db_url = os.environ.get("DATABASE_URL", "postgresql://postgres:gboZqzfSIzXOHrCnZoUKsNsComFobsnr@postgres.railway.internal:5432/railway")
    if db_url.startswith("postgres://"):
        db_url = db_url.replace("postgres://", "postgresql://", 1)
else:
    db_url = "sqlite:///shipping_register.db"

# In production on Railway, construct the backend API URL from the public domain.
if is_prod:
    _public_domain = os.environ.get("RAILWAY_PUBLIC_DOMAIN", "")
    api_url = f"https://{_public_domain}" if _public_domain else "http://localhost:8000"
else:
    api_url = "http://localhost:8000"

config = rx.Config(
    app_name="shipping_register",
    db_url=db_url,
    frontend_host="0.0.0.0" if is_prod else "127.0.0.1",
    backend_host="0.0.0.0" if is_prod else "127.0.0.1",
    api_url=api_url,
    env=rx.Env.PROD if is_prod else rx.Env.DEV,
    disable_plugins=[SitemapPlugin],
)