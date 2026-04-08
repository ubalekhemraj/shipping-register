#!/bin/bash
echo "============================================"
echo " Medical Shop Shipping Register - Setup"
echo "============================================"
echo

# Install dependencies
echo "[1/3] Installing dependencies..."
pip install "reflex>=0.6.0" "openpyxl>=3.1.0"

# Initialize Reflex (first time only)
echo
echo "[2/3] Initializing Reflex project..."
reflex init

# Run the app
echo
echo "[3/3] Starting the application..."
echo
echo "  Open your browser at: http://localhost:3000"
echo "  Press Ctrl+C to stop the server"
echo
reflex run
