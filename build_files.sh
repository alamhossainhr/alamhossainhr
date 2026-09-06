#!/bin/bash

echo "Creating virtual environment..."
python3 -m venv .build_venv
source .build_venv/bin/activate

echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

# Ensure staticfiles directory exists so Vercel build does not fail
mkdir -p staticfiles

echo "Build process completed!"
