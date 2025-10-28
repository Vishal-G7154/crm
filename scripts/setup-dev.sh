#!/bin/bash
set -e

echo "Setting up development environment..."

# Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Copy environment file
cp .env.example .env

# Start services
docker-compose up -d db

echo "Development environment ready!"
echo "Run: source .venv/bin/activate && make run"
