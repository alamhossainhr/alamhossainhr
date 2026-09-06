#!/bin/bash

echo "Installing dependencies with uv..."
uv pip install -r requirements.txt --system

echo "Collect Static..."
python3 manage.py collectstatic --noinput --clear

echo "Build process completed!"