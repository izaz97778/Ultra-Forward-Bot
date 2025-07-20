#!/bin/bash

echo "Starting Ultra Forward Bot..."

# Start web server in background (if you have one)
gunicorn app:app &

# Start the main Telegram bot
python3 main.py
