#!/bin/bash

# Build the project
echo "Building the project..."
python3 -m pip install -r requirements.txt --no-cache-dir --break-system-packages

echo "Collect Static..."
python3 manage.py collectstatic --noinput --clear

echo "Build process completed!"